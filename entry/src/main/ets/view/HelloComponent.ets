
@Component
export default struct HelloComponent {
  @State message:string = 'Hello, World';

  build() {
    Row(){
      Text(this.message)
        .onClick(() => {
          this.message = 'Hello, ArkUI';
        });
    }
  }
}