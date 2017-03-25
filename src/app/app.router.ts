import { ModuleWithProviders } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { BootstrapResolver } from './routing/resolvers/bootstrap.resolver';
import { WorkResolver } from './routing/resolvers/work.resolver';
import { CvResolver } from './routing/resolvers/cv.resolver';

import { MainComponent } from './states/main/main.component';
import { WorkComponent } from './states/work/work.component';
import { WorkListComponent } from './states/work-list/work-list.component';
import { WorkDetailsComponent } from './states/work-details/work-details.component';
import { CvComponent } from './states/cv/cv.component';

export class AppRouter {

    static routes: Routes = [
    {
      path: '',
      component: MainComponent,
      resolve: { bootstrap: BootstrapResolver },
      children: [

        // work
        {
          path: '',
          redirectTo: 'work',
          pathMatch: 'full',
        },
        {
          path: 'work',
          component: WorkComponent,
          resolve: { work: WorkResolver },
          children: [
            {
              path: '',
              component: WorkListComponent,
            },
            {
              path: ':workId',
              component: WorkDetailsComponent,
            },
          ]
        },

        // cv
        {
          path: 'cv',
          component: CvComponent,
          resolve: { cv: CvResolver },
        },
      ],
    },
  ];

  static module: ModuleWithProviders = RouterModule.forRoot(AppRouter.routes);
}
