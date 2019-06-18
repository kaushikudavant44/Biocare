function choosePencilElseEraser(canvasDiv){

$("#pen").click(function(){ mode="pen"; });
$("#eraser").click(function(){ mode="eraser"; });
$("#textB").click(function(){ mode="textB"; });
$("#rect").click(function(){ mode="rect"; });
	var element = null;
	var offsets;
	var top1;
	var left1;
	var canvas;
	var createCanvas=document.getElementById("mode").value;
	if(createCanvas==0){
	createDivAndCanvas(event);
	}
	function createDivAndCanvas(e){
		if(selectStatus==3){
		
			var ev = e || window.event;
			
			element = document.createElement('div');
			element.setAttribute("style","height:100%");
			element.setAttribute("style","width:100%");
            element.className = 'rectangle'
			element.setAttribute("id","drawDiv");	
      
			offsets = canvasDiv.getBoundingClientRect();
			top1 = offsets.top-70;
			left1= offsets.left;
			 
			element.style.left = left1+'px';	 
            element.style.top = top1+'px';			
            canvasDiv.appendChild(element);
				
			canvas=document.createElement('canvas');
			canvas.setAttribute("id","drawCanvas");			
			canvas.width  = 1280;
			canvas.height = 480;
			canvas.style.zIndex   = 8;
			canvas.style.position = "absolute";
			canvas.style.border   = "1px solid";
			element.appendChild(canvas);
			document.getElementById("mode").value=1;						
			init(canvas);
	}
}

	var lastX;
	var lastY;
	var strokeColor="red";
	var strokeWidth=7;
	var mouseX;
	var mouseY;
	var touchX,touchY;
	var canvasOffset=$("#drawCanvas").offset();
	var offsetX=offsets.left;
	var offsetY=offsets.top;
	var isMouseDown=false;	
	var isTouchStart=false;
	var size;
	var color;
	
	
function init(canvas){
		
	if (canvas.getContext)
	var ctx = canvas.getContext('2d');

	function handleMouseDown(e){
	
		mouseX=parseInt(e.clientX-offsetX);
		mouseY=parseInt(e.clientY-offsetY);

		// Put your mousedown stuff here
		lastX=mouseX;
		lastY=mouseY;
		isMouseDown=true;
	}
		
	function handleMouseUp(e){
  
		mouseX=parseInt(e.clientX-offsetX);
		mouseY=parseInt(e.clientY-offsetY);

		// Put your mouseup stuff here
		isMouseDown=false;
	}

	function handleMouseOut(e){
		
		mouseX=parseInt(e.clientX-offsetX);
		mouseY=parseInt(e.clientY-offsetY);

		// Put your mouseOut stuff here
		isMouseDown=false;
	}

	function handleMouseMove(e){
	if(selectStatus==3){
		mouseX=parseInt(e.clientX-offsetX);
		mouseY=parseInt(e.clientY-offsetY);

		// Put your mousemove stuff here
		if(isMouseDown){
		ctx.beginPath();
		if(mode=="pen"){
		size=$('#weigth').val();
		color=$('#color').val();
		
		ctx.strokeStyle ="#"+color;
		ctx.lineWidth = size;
		
		ctx.globalCompositeOperation="source-over";
		ctx.moveTo(lastX,lastY);
		ctx.lineTo(mouseX,mouseY);
		ctx.stroke();     
    }else{
		ctx.globalCompositeOperation="destination-out";
		ctx.arc(lastX,lastY,8,0,Math.PI*2,false);
		ctx.fill();
    }
    lastX=mouseX;
    lastY=mouseY;
  }
}
}





$("#drawCanvas").mousedown(function(e){handleMouseDown(e);});
$("#drawCanvas").mousemove(function(e){handleMouseMove(e);});
$("#drawCanvas").mouseup(function(e){handleMouseUp(e);});
$("#drawCanvas").mouseout(function(e){handleMouseOut(e);});
 // React to touch events on the canvas1
canvas.addEventListener('touchstart', sketchpad_touchStart, false);
canvas.addEventListener('touchend', sketchpad_touchEnd, false);
canvas.addEventListener('touchmove', sketchpad_touchMove, false);

size=$('#weigth').val();
//var mode="pen";

	// Get the touch position relative to the top-left of the canvas1
    // When we get the raw values of pageX and pageY below, they take into account the scrolling on the page
    // but not the position relative to our target div. We'll adjust them using "target.offsetLeft" and
    // "target.offsetTop" to get the correct values in relation to the top left of the canvas1.
    function getTouchPos(e) {
        if (!e)
            var e = event;

        if(e.touches) {
            if (e.touches.length == 1) { // Only deal with one finger
                var touch = e.touches[0]; // Get the information for finger #1
                touchX=touch.pageX-touch.target.offsetLeft;
                touchY=touch.pageY-touch.target.offsetTop-50;
            }
        }
    }
	var startX,startY;
 // Draw something when a touch start is detected
    function sketchpad_touchStart() {
        // Update the touch co-ordinates
        getTouchPos();
		startX=touchX;
		startY=touchY;
		
		isTouchStart=true;
        if(mode=="pen" || mode=="eraser"){
		drawLine(ctx,touchX,touchY,size);
		}
        // Prevents an additional mousedown event being triggered
        event.preventDefault();
    }

	var endX,endY;
    function sketchpad_touchEnd() {
        // Reset lastX and lastY to -1 to indicate that they are now invalid, since we have lifted the "pen"
        if(mode=="rect"){
			
		getTouchPos();
		drawRect(startX,startY,endX,endY);
		
		}
		isTouchStart=false;
		lastX=-1;
        lastY=-1;

    }

    // Draw something and prevent the default scrolling when touch movement is detected
    function sketchpad_touchMove(e) { 
        // Update the touch co-ordinates
        getTouchPos(e);
		endX=touchX-startX;
		endY=touchY-startY;
		isTouchStart=true;
        // During a touchmove event, unlike a mousemove event, we don't need to check if the touch is engaged, since there will always be contact with the screen by definition.
        if(mode=="pen" || mode=="eraser"){
		drawLine(ctx,touchX,touchY,size); 
		}
        // Prevent a scrolling action as a result of this touchmove triggering.
        event.preventDefault();
    }

	function drawRect(x,y,x1,y1) {
		ctx.beginPath();	
			ctx.strokeStyle ="#"+color;
			ctx.lineCap = "round";
			ctx.lineJoine= "round";
			ctx.globalCompositeOperation="source-over";
		isTouchStart=true;
        ctx.rect(x,y,x1,y1);
		ctx.stroke();
		}
	
	function drawLine(ctx,x,y,size) {
				
        // If lastX is not set, set lastX and lastY to the current position 
        if (lastX==-1) {
            lastX=x;
			lastY=y;
        }
		
		isTouchStart=true;
		color=$('#color').val();
		
		
	if(isTouchStart==true){

		if(mode=="pen"){
		
			ctx.beginPath();	
			ctx.strokeStyle ="#"+color;
			ctx.lineCap = "round";
			ctx.lineJoine= "round";
			ctx.globalCompositeOperation="source-over";

			// First, move to the old (previous) position
			ctx.moveTo(lastX,lastY);

			// Now draw a line to the current touch/pointer position
			ctx.lineTo(x,y);

			// Set the line thickness and draw the line
			ctx.lineWidth = size;
			ctx.stroke();     
			
    }else if(mode=="eraser"){
			ctx.beginPath();
			ctx.globalCompositeOperation="destination-out";
			ctx.arc(lastX,lastY,18,0,Math.PI*2,false);
			ctx.fill();

			
    }else if(mode=="rect"){
			ctx.beginPath();	
			ctx.strokeStyle ="#"+color;
			ctx.lineCap = "round";
			ctx.lineJoine= "round";
			ctx.globalCompositeOperation="source-over";
			getTouchPos();
			drawRect(startX,startY,endX,endY);

	}
}
		lastX=x;
		lastY=y;
		}		
	}
}

