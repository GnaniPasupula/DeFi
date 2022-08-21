import Debug "mo:base/Debug"; 
import Float "mo:base/Float"; 
import Time "mo:base/Time"; 

actor Dbank{
  stable var currentValue:Float=1000;

  stable var startTime=Time.now();

  public func topUp(amount:Float) {
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

   public func topDown(amount:Float) {
    let temp:Float =currentValue-amount;
    if(temp>=0){
        currentValue -=amount;
        Debug.print(debug_show(currentValue));
    }
    else{
        Debug.print("Not sufficient amount");
    }
  };

  public query func checkBalance() : async Float{
    return currentValue;
  };

  public func compound(){
    let currentTime= Time.now();
    let timeElapsedNS=currentTime-startTime;
    let timeElapsedS=timeElapsedNS/1000000000;
    currentValue:=currentValue*(1.01**Float.fromInt(timeElapsedS));
    startTime:=currentTime;
  }

  // topUp();
}
