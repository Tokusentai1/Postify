<?php

namespace App\Filament\Admin\Pages\Auth;

use Filament\Pages\Auth\Register as BaseRegister;
use Filament\Forms\Components\Component;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Toggle;

class Register extends BaseRegister
{

    protected function getForms(): array
    {
        return [
            'form' => $this->form(
                $this->makeForm()
                    ->schema([
                        $this->getNameFormComponent(),
                        $this->getEmailFormComponent(),
                        $this->getPasswordFormComponent(),
                        $this->getPasswordConfirmationFormComponent(),
                        $this->getGenderFormComponent(),
                        $this->getAdminFormComponent(),
                    ])
                    ->statePath('data'),
            ),
        ];
    }

    protected function getGenderFormComponent(): Component
    {
        return Select::make('gender')
            ->label('Gender')
            ->options([
                'male' => 'Male',
                'female' => 'Female',
            ])
            ->required();
    }

    public function getAdminFormComponent(): Component
    {
        return Toggle::make('is_admin')
            ->label('Admin')
            ->required();
    }
}
