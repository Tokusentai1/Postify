<?php

namespace App\Filament\Admin\Resources;

use Rmsramos\Activitylog\Actions\ActivityLogTimelineTableAction;
use App\Filament\Admin\Resources\PostResource\Pages;
use Filament\Tables\Filters\SelectFilter;
use Filament\Forms\Components\Section;
use Filament\Resources\Resource;
use Filament\Forms\Form;
use Filament\Tables\Table;
use Filament\Tables;
use App\Models\Post;
use Filament\Forms;

class PostResource extends Resource
{
    protected static ?string $model = Post::class;

    protected static ?string $navigationIcon = 'heroicon-o-document';

    protected static ?string $activeNavigationIcon = 'heroicon-s-document';

    protected static ?string $navigationGroup = 'Blog';

    public static function form(Form $form): Form
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
                        Forms\Components\MarkdownEditor::make('description')
                            ->label(__('post_fields.description'))
                            ->string()
                            ->minLength(10)
                            ->maxLength(200)
                            ->required()
                            ->columnSpanFull(),
                    ])->columns(2),
                Section::make(__('category_fields.pick_user_and_category'))
                    ->description(__('category_fields.pick_user_and_category_desc'))
                    ->collapsible()
                    ->schema([
                        Forms\Components\Select::make('user_id')
                            ->label(__('user_fields.author'))
                            ->prefixIcon('heroicon-o-user')
                            ->prefixIconColor('primary')
                            ->searchable()
                            ->relationship('user', 'name')
                            ->preload()
                            ->required(),
                        Forms\Components\Select::make('categories.id')
                            ->label(__('category_fields.name'))
                            ->prefixIcon('heroicon-o-tag')
                            ->prefixIconColor('primary')
                            ->relationship('categories', 'name')
                            ->multiple()
                            ->preload()
                            ->required(),
                    ])->columns(2)
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
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
                    ->toggleable(),
                Tables\Columns\TextColumn::make('user.name')
                    ->label(__('user_fields.author'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-user')
                    ->iconColor('primary')
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
            ->filters([
                SelectFilter::make('categories.name')
                    ->label(__('category_fields.names'))
                    ->relationship('categories', 'name')
                    ->multiple()
                    ->preload()
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
                Tables\Actions\DeleteAction::make(),
                ActivityLogTimelineTableAction::make('Activities')
                    ->label(__('user_fields.activity_log')),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListPosts::route('/'),
            'create' => Pages\CreatePost::route('/create'),
            'edit' => Pages\EditPost::route('/{record}/edit'),
        ];
    }
}
