<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        $this->call(MenusTableSeeder::class);
        $this->call(MenuItemsTableSeeder::class);
        $this->call(RolesAndPermissionsSeeder::class);
        $this->call(PermissionGroupsSeeder::class);
        $this->call(UsersTableSeeder::class);
    }
}
