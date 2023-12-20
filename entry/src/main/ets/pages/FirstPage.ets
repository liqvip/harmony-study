import router from '@ohos.router';
import AppContext from '@ohos.app.ability.common';
import CommonConstants from '../common/constants/CommonConstants';
import Routes from '../common/constants/Routes';
import Logger from '../common/util/Logger';
import Want from '@ohos.app.ability.Want';

@Entry
@Component
struct FirstPage {
  @State message: string = 'First Page';
  TAG = 'FirstPage';

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(CommonConstants.FONT_SIZE)
          .fontWeight(FontWeight.Bold)

        Blank()

        Button($r('app.string.next_page'))
          .fontSize(CommonConstants.BUTTON_FONT_SIZE)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            router.pushUrl({
              url: Routes.secondPage,
              // 页面之间的数据传递，自定义参数
              params: {
                src: 'FirstPage 页面传来数据'
              }
            }).catch((error: Error) => {
              Logger.info(this.TAG, 'FirstPage push error' + JSON.stringify(error));
            });
          })

        Blank()

        Button($r('app.string.next_ability'))
          .fontSize(CommonConstants.BUTTON_FONT_SIZE)
          .width(CommonConstants.BUTTON_WIDTH)
          .height(CommonConstants.BUTTON_HEIGHT)
          .backgroundColor($r('app.color.button_bg'))
          .onClick(() => {
            let handler = getContext(this) as AppContext.UIAbilityContext;
            const want: Want = {
              bundleName: getContext(this).applicationInfo.name,
              abilityName: 'SecondAbility',
            };
            try {
              handler.startAbility(want);
            } catch (error) {
              Logger.info(this.TAG, error)
            }
          })

      }
      .width(CommonConstants.FULL_WIDTH)
      .height(CommonConstants.LAYOUT_HEIGHT)
    }
    .height(CommonConstants.FULL_HEIGHT)
    .backgroundColor($r('app.color.page_bg'))
  }
}