import UIAbility from '@ohos.app.ability.UIAbility';
import hilog from '@ohos.hilog';
import window from '@ohos.window';

export default class EntryAbility extends UIAbility {
  domain = 0x0000;
  TAG = 'EntryAbility';

  onCreate(want, launchParam) {
    // 应用初始化操作，例如变量定义资源加载等，用于后续的UI界面展示。
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onCreate');
  }

  onWindowStageCreate(windowStage: window.WindowStage) {
    // 通过loadContent()方法设置应用要加载的页面，
    // 并根据需要调用on('windowStageEvent')方法订阅WindowStage的事件（获焦/失焦、可见/不可见）。
    // Main window is created, set main page for this ability
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/LifeCyclePage', (err, data) => {
      if (err.code) {
        hilog.error(this.domain, this.TAG, 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }
      hilog.info(this.domain, this.TAG, 'Succeeded in loading the content. Data: %{public}s', JSON.stringify(data) ?? '');
    });
  }

  onForeground() {
    // 申请系统所需的资源或在onBackground中申请释放的资源
    // Ability has brought to foreground
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onForeground');
  }

  onBackground() {
    // UI不可见时释放无用资源，或在此回调中执行耗时操作
    // 例如，状态保存
    // Ability has back to background
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onBackground');
  }

  onWindowStageDestroy() {
    // Main window is destroyed, release UI related resources
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onWindowStageDestroy');
  }

  onDestroy() {
    // Destroy状态在UIAbility实例销毁时触发。
    // 可以在onDestroy()回调中进行系统资源的释放、数据的保存等操作
    hilog.info(this.domain, this.TAG, '%{public}s', 'Ability onDestroy');
  }



}
