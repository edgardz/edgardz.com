import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { HttpModule } from '@angular/http';
import { NgReduxModule, NgRedux, DevToolsExtension } from '@angular-redux/store';

import { IAppState, rootReducer } from './redux/store';

import { AppRouter } from './app.router';

import { BootstrapResolver } from './routing/resolvers/bootstrap.resolver';
import { WorkResolver } from './routing/resolvers/work.resolver';
import { CvResolver } from './routing/resolvers/cv.resolver';

import { AppComponent } from './app.component';
import { MainComponent } from './states/main/main.component';
import { WorkComponent } from './states/work/work.component';
import { WorkDetailsComponent } from './states/work-details/work-details.component';
import { CvComponent } from './states/cv/cv.component';
import { HeaderComponent } from './components/header/header.component';
import { WorkListComponent } from './states/work-list/work-list.component';

@NgModule({
  declarations: [
    AppComponent,
    MainComponent,
    WorkComponent,
    WorkDetailsComponent,
    CvComponent,
    HeaderComponent,
    WorkListComponent
  ],
  imports: [
    BrowserModule,
    FormsModule,
    HttpModule,
    NgReduxModule,
    AppRouter.module
  ],
  providers: [
    BootstrapResolver,
    WorkResolver,
    CvResolver
  ],
  bootstrap: [AppComponent]
})
export class AppModule {
  constructor(
    public ngRedux: NgRedux<IAppState>,
    public devTool: DevToolsExtension
  ) {
    const initialState = {};
    const middlewares = [];
    const enhancers = [
      devTool.isEnabled() ? devTool.enhancer() : f => f,
    ];
    this.ngRedux.configureStore(rootReducer, initialState, middlewares, enhancers);
  }
}
