import { EdgardzPage } from './app.po';

describe('edgardz App', () => {
  let page: EdgardzPage;

  beforeEach(() => {
    page = new EdgardzPage();
  });

  it('should display message saying app works', () => {
    page.navigateTo();
    expect(page.getParagraphText()).toEqual('app works!');
  });
});
