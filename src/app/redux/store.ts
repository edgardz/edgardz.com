import { combineReducers } from 'redux';

import { IEnvState, envReducer } from './reducers/env.reducer';

export class IAppState {
  env?: IEnvState;
};

export const rootReducer = combineReducers<IAppState>({
  env: envReducer,
});
