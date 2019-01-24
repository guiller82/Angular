import { Component,
   OnInit, 
   Input, 
   SimpleChanges, ViewChild, ElementRef, ContentChild } from '@angular/core';

@Component({
  selector: 'app-server-element',
  templateUrl: './server-element.component.html',
  styleUrls: ['./server-element.component.css']
})

export class ServerElementComponent implements OnInit {
@Input('srvElement') element:{type:string, name:string, content:string};
@Input () name:string;
@ViewChild('heading') header: ElementRef;
@ContentChild ('contentParagraph') paragraph: ElementRef;

  constructor() { 
    console.log('Constructor Called');
  }

  ngOnInit() {
    console.log('ngOnInit Called');
    console.log('Tex Content' + this.header.nativeElement.textContent);
    console.log('paragraph Content' + this.paragraph.nativeElement.textContent);
  }

  ngOnChanges(changes: SimpleChanges){
    console.log('ngOnChanges Called'); 
    console.log(changes); 
  }

  ngDoCheck(){
    console.log('ngOnCngDoCheckhanges Called'); 
}

ngAfterContentInit(){
  console.log('ngAfterContentInit Called'); 
  
}


ngAfterViewInit(){
  console.log('Tex Content ' + this.header.nativeElement.textContent);
  console.log('ngAfterViewInit Called'); 
}

ngOnDestroy(){
 // console.log('Tex Content' + this.header.nativeElement.textContent);
  console.log('ngOnDestroy Called'); 
}

} 
