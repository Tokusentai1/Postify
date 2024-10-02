<?php

namespace App\Filament\Admin\Widgets;

use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;
use Filament\Support\Enums\IconPosition;
use App\Models\User;

class UserCountWidget extends BaseWidget
{
    protected function getStats(): array
    {
        return [
            Stat::make(__('widget_fields.users'), User::where('is_admin', false)->count())
                ->description(__('widget_fields.description'))
                ->descriptionIcon('heroicon-s-user-group', IconPosition::Before)
                ->chart([10, 5, 2, 7, 4, 2, 1])
                ->color('success')
        ];
    }
}
