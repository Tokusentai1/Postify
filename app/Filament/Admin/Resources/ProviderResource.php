<?php

namespace App\Filament\Admin\Resources;

use App\Filament\Admin\Resources\ProviderResource\Pages;
use Filament\Resources\Resource;
use Filament\Tables\Table;
use App\Models\Provider;
use Filament\Forms\Form;
use Filament\Tables;

class ProviderResource extends Resource
{
    protected static ?string $model = Provider::class;

    protected static ?string $navigationIcon = 'heroicon-s-hashtag';

    protected static ?string $navigationGroup = 'Users Information';

    protected static ?int $navigationSort = 2;

    public static function canCreate(): bool
    {
        return false;
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('provider_name')
                    ->label(__('provider_fields.provider_name'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-hashtag')
                    ->iconColor('primary')
                    ->alignStart()
                    ->toggleable(),
                Tables\Columns\TextColumn::make('user.email')
                    ->label(__('provider_fields.email'))
                    ->searchable(isIndividual: true)
                    ->icon('heroicon-s-user')
                    ->iconColor('primary')
                    ->alignEnd()
                    ->toggleable(),
            ])
            ->filters([])
            ->actions([])
            ->bulkActions([]);
    }

    public static function getRelations(): array
    {
        return [];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProviders::route('/'),
        ];
    }
}
