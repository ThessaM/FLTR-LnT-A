
int number = 29;
final String date = "Saturday";
const int time = 16;
double price = 13.45;
bool isSunday = false;
//Map<key, value>
Map<String, int> mappedValue = {"saturday": 6, "sunday": 7};

var number2 = "41";

late String hello;

void setup(){
  hello = "Hello World";
}

int? number3; //number3 variabel nullable -> bisa memiliki value null

int a = 44;
int b = 7;

void main() {
//   print(number);
//   print(date);
//   number = 28;
//   print(number);
//   print(price);
//   print(isSunday);
  print(mappedValue["saturday"]);
  print(mappedValue);
  
//   setup();
//   print(hello);
//   print(number3);
//   number3 = 31;
//   print(number3!); //Null assertion (!) mengubah value nullable ke non-nullable
  
//   print(a+b);
//   print(a-b);
//   print(a*b);
//   print(a/b);
//   print(a%b);
//   print(a~/b);
  
//   print(a == b);
//   print(a != b);
//   print(a < b);
//   print(a <= b);
//   print(a > b);
//   print(a >= b);
  
//   a+=3;
//   print(a);
  
//   print(a > b? "yes" : "no");
  print(number3 ?? "is null");
  
//   print(a == 47 && a > 10);
//   print(a == 44 || a > 10);
//   print(!(a == 4));
  
//   List<int> intList = [11, 12, 13, 14];
//   List<int> intList2 = List.filled(5, 0);
//   List<int> intList3 = List.empty();
//   print(intList[0]);
//   print(intList2[2]);
//   intList.add(56);
  
//   //Looping
//   for(int i = 0; i<5; i++){
//     print(i);
//   }
//   for(var i in intList){
//     print(i);
//   }
  
//   int cur = 0;
//   while(cur < 3){
//     print(cur);
//     cur+=1;
//   }
  
//   do{
//     print(cur);
//     cur+=1;
//   }while(cur < 6);
  
//   for(int i = 10; i<20; i++){
//     if(i < 15){
//       continue;
//     } else if(i == 19){
//       break;
//     }
//     print(i);
//   }
  
//   int c = 8;
//   switch(c){
//     case 8:
//       print("C is 8");
//       break;
//     case 10:
//       print("C is 10");
//     default:
//       break;
//   }
  
}












