// class TransportPipe extends HazardPipe { 
//     // public TransportPipe(){

//     // }

//     private void generatePipe(){

//         //Top Pipe
//         fill(0);
//         noStroke();
//         rect(this.xPosition, 0, this.pipeWidth, this.topPipeYPosition);

//         //bottom pipe
//         fill(0);
//         noStroke();
//         rect(this.xPosition, this.bottomPipeYPosition, this.pipeWidth, height);
//     }

//     public boolean collison(int x, int y){
    
//         //top pipe 
//         if(((x < this.xPosition) || (x > this.xPosition + this.pipeWidth))){
            
//             return false;

//         } else if (((x >= this.xPosition) && (x <= this.xPosition + this.pipeWidth))){
            
//             //need to edit this to allow for transportation
//             if( y < this.bottomPipeYPosition && y > this.topPipeYPosition){
            
//                 return false;
            
//             }
//         }

//         return true;
    
//     }

// }
