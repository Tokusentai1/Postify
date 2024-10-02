<?php

namespace App\Filament\Admin\Resources\ProviderResource\Pages;

use App\Filament\Admin\Resources\ProviderResource;
use Filament\Resources\Pages\EditRecord;
use Filament\Actions;

class EditProvider extends EditRecord
{
    protected static string $resource = ProviderResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
