<?php

namespace App\Filament\Admin\Resources\UserResource\Pages;

use App\Filament\Admin\Resources\UserResource;
use Filament\Resources\Pages\ListRecords;
use Illuminate\Database\Eloquent\Builder;
use Filament\Resources\Components\Tab;
use Filament\Actions;

class ListUsers extends ListRecords
{
    protected static string $resource = UserResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\CreateAction::make(),
        ];
    }

    public function getTabs(): array
    {
        return [
            'All Users' => Tab::make(__('user_fields.all_users'))
                ->icon('heroicon-s-user-group'),
            'Admins' => Tab::make(__('user_fields.admin_users'))
                ->modifyQueryUsing(fn(Builder $query) => $query->where('is_admin', true))
                ->icon('heroicon-s-shield-check'),
            'Users' => Tab::make(__('user_fields.users'))
                ->modifyQueryUsing(fn(Builder $query) => $query->where('is_admin', false))
                ->icon('heroicon-s-users'),
        ];
    }
}
