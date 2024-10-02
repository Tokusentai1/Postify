<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\CategoryResource\RelationManagers\PostsRelationManager;
use Rmsramos\Activitylog\Actions\ActivityLogTimelineTableAction;
use App\Filament\Admin\Resources\CategoryResource\Pages;
use Filament\Forms\Components\Section;
use Filament\Resources\Resource;
use Filament\Tables\Table;
use Filament\Forms\Form;
use App\Models\Category;
use Filament\Tables;
use Filament\Forms;

class CategoryResource extends Resource
{
    protected static ?string $model = Category::class;

    protected static ?string $navigationIcon = 'heroicon-o-squares-2x2';

    protected static ?string $activeNavigationIcon = 'heroicon-s-squares-2x2';

    protected static ?string $navigationGroup = 'Blog';

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Section::make(__('category_fields.create_category'))
                    ->description(__('category_fields.create_category_desc'))
                    ->collapsible()
                    ->schema([
                        Forms\Components\TextInput::make('name')
                            ->label(__('category_fields.name'))
                            ->prefixIcon('heroicon-o-tag')
                            ->prefixIconColor('primary')
                            ->notRegex('/[0-9]/')
                            ->minLength(3)
                            ->maxLength(15)
                            ->required(),
                    ])
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('name')
                    ->label(__('category_fields.name'))
                    ->searchable()
                    ->icon('heroicon-s-tag')
                    ->iconColor('primary')
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
        return [
            PostsRelationManager::class,
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCategories::route('/'),
            'edit' => Pages\EditCategory::route('/{record}/edit'),
        ];
    }
}
