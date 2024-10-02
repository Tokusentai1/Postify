<?php

namespace App\Filament\Admin\Resources\CategoryResource\Pages;

use App\Filament\Admin\Resources\CategoryResource;
use Filament\Resources\Pages\CreateRecord;
use Filament\Actions;

class CreateCategory extends CreateRecord
{
    protected static string $resource = CategoryResource::class;
}
