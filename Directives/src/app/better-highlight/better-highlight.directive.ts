import { Directive, OnInit,ElementRef,Renderer2, HostListener, HostBinding, Input  } from '@angular/core';

@Directive({
  selector: '[appBetterHighlight]'
})
export class BetterHighlightDirective implements OnInit  {
  @Input () defaultColor:string = 'blue';
  @Input ('appBetterHighlight') highlightColor:string = 'red';
  @HostBinding('style.backgroundColor') backgroundColor:string=this.defaultColor;


 constructor(private elRef: ElementRef, private renderer: Renderer2) { }


ngOnInit (){
 // this.renderer.setStyle(this.elRef.nativeElement, 'background-color', 'blue')
 this.backgroundColor = this.defaultColor;
}

@HostListener('mouseenter') mouseOver(eventData:Event) {
 // this.renderer.setStyle(this.elRef.nativeElement, 'background-color', 'red')
 this.backgroundColor = this.highlightColor;
}

@HostListener('mouseleave') mouseLeave(eventData:Event) {
//  this.renderer.setStyle(this.elRef.nativeElement, 'background-color', 'yellow')
this.backgroundColor = 'yellow';
}




}
