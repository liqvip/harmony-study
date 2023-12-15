import hilog from '@ohos.hilog';

/**
 * https://ost.51cto.com/posts/3385
 * 日志工具类
 * 参数 domain 用于指定输出日志所对应的业务领域，取值范围为0x0~0xFFFFF，开发者可以根据需要进行自定义。
 * 参数 format 格式字符串，每个参数需要添加隐私标识 {public} 或 {private}
 * {public} 表示日志打印结果可见，{private} 表示日志打印结果不可见
 */

class Logger {
  private domain:number = 0xff00;
  private format: string = '%{public}s, %{public}s';

  info(tag: string, ...args: string[]){
    hilog.info(this.domain, tag, this.format, args);
  }
}

export default new Logger();