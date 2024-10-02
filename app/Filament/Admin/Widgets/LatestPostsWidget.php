<?php

namespace App\Filament\Admin\Widgets;

use Filament\Widgets\TableWidget as BaseWidget;
use App\Filament\Admin\Resources\PostResource;
use Filament\Tables\Table;
use Filament\Tables;

class LatestPostsWidget extends BaseWidget
{
    protected static ?int $sort = 3;

    protected int | string | array $columnSpan = 'full';

    public function table(Table $table): Table
    {
        return $table
            ->query(PostResource::getEloquentQuery())
            ->defaultPaginationPageOption(5)
            ->defaultSort('created_at', 'desc')
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
            ]);
    }
}
