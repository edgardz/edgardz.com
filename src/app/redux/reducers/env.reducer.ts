import { environment } from '../../../environments/environment';

export interface IEnvState {
  production: boolean;
}

const INIT_STATE: IEnvState = environment;

export function envReducer(state = INIT_STATE): IEnvState {
  return state;
}
