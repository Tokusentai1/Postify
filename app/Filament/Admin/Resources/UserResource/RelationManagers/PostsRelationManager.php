<?php

namespace App\Filament\Admin\Resources\UserResource\RelationManagers;

use Filament\Resources\RelationManagers\RelationManager;
use Filament\Forms\Components\Section;
use Filament\Tables\Table;
use Filament\Forms\Form;
use Filament\Tables;
use Filament\Forms;

class PostsRelationManager extends RelationManager
{
    protected static string $relationship = 'posts';

    public function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make(__('post_fields.create_post'))
                    ->description(__('post_fields.create_post_desc'))
                    ->collapsible()
                    ->schema([
                        Forms\Components\TextInput::make('title')
                            ->label(__('post_fields.title'))
                            ->prefixIcon('heroicon-o-book-open')
                            ->prefixIconColor('primary')
                            ->string()
                            ->minLength(4)
                            ->maxLength(50)
                            ->required(),
                        Forms\Components\MarkdownEditor::make('description')
                            ->label(__('post_fields.description'))
                            ->string()
                            ->minLength(10)
                            ->maxLength(200)
                            ->required(),
                        Forms\Components\FileUpload::make('image')
                            ->label(__('post_fields.image'))
                            ->directory('images')
                            ->image()
                            ->imageEditor()
                            ->imageEditorAspectRatios([
                                null,
                                '16:9',
                                '4:3',
                                '1:1',
                            ])
                            ->minSize(10)
                            ->maxSize(2048)
                            ->required(),
                        Forms\Components\Select::make('categories.id')
                            ->label(__('category_fields.name'))
                            ->prefixIcon('heroicon-o-tag')
                            ->prefixIconColor('primary')
                            ->relationship('categories', 'name')
                            ->multiple()
                            ->preload()
                            ->required(),
                    ])
            ]);
    }

    public function table(Table $table): Table
    {
        return $table
            ->recordTitleAttribute('title')
            ->columns([
                Tables\Columns\TextColumn::make('title')
                    ->label(__('post_fields.title'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-book-open')
                    ->iconColor('primary')
                    ->toggleable(),
                Tables\Columns\TextColumn::make('description')
                    ->label(__('post_fields.description'))
                    ->icon('heroicon-s-document-text')
                    ->iconColor('primary')
                    ->toggleable(),
                Tables\Columns\ImageColumn::make('image')
                    ->label(__('post_fields.image'))
                    ->size(80)
                    ->toggleable(),
                Tables\Columns\TextColumn::make('categories.name')
                    ->label(__('category_fields.name'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-tag')
                    ->iconColor('primary')
                    ->listWithLineBreaks()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->label(__('user_fields.created_at'))
                    ->dateTime('Y-m-d H:i:s')
                    ->icon('heroicon-s-calendar')
                    ->iconColor('primary')
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->label(__('user_fields.updated_at'))
                    ->dateTime('Y-m-d H:i:s')
                    ->icon('heroicon-s-calendar')
                    ->iconColor('primary')
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([])
            ->headerActions([
                Tables\Actions\CreateAction::make(),
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }
}
