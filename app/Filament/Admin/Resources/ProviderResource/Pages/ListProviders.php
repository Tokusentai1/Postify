<?php

namespace App\Filament\Admin\Resources\ProviderResource\Pages;

use App\Filament\Admin\Resources\ProviderResource;
use Filament\Resources\Pages\ListRecords;
use Filament\Actions;

class ListProviders extends ListRecords
{
    protected static string $resource = ProviderResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }
}
