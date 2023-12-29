         BR      main,i

firstn:   .BLOCK 1       
lastname: .BLOCK 1
num:     .BLOCK  2
num2:    .BLOCK  2           
ad1:     .BLOCK  1

peter:   .ASCII  " Peter\x00 "
joe:     .ASCII  " Joe\x00 "
glen:    .ASCII  " Glen\x00 "
lois:    .ASCII  " Lois\x00 "

griffin: .ASCII  " Griffin\n\x00 "
brown:   .ASCII  " Brown\n\x00 "
swanson: .ASCII  " Swanson\n\x00 "
tucker:  .ASCII  " Tucker\n\x00 "          

errorf:   .ASCII "Invalid Character, try again {P,J,G,L}\n\x00"
errorl:  .ASCII  "Invalid Character, try again {G,B,S,T}\n\x00"
errorn:  .ASCII  "Number must be positive\n\x00"
errorad: .ASCII  "Invalid Character, try again {A,D}\n\x00" 


main:    LDBA    0xFC15,d
         STBA    firstn,d
         CPBA    0xA,i
         BREQ    main,i 
         CPBA    'P',i
         BREQ    lname,i
         CPBA    'J',i
         BREQ    lname,i
         CPBA    'G',i
         BREQ    lname,i
         CPBA    'L',i
         BREQ    lname,i
         STRO    errorf,d    
         BR      main,i

lname:   LDBA    0xFC15,d
         STBA    lastname,d
         CPBA    0xA,i
         BREQ    lname,i
         CPBA    'G',i       
         BREQ    number,i 
         CPBA    'B',i
         BREQ    number,i 
         CPBA    'S',i
         BREQ    number,i 
         CPBA    'T',i
         BREQ    number,i 
         STRO    errorl,d
         BR      lname,i

number:  DECI    num,d
         LDWA    num,d
         CPWA    1,i
         BRGE    ad
         STRO    errorn,d
         BR      number,i    

ad:      LDBA    0xFC15,d
         STBA    ad1,d
         CPBA    0xA,i
         BREQ    ad,i
         CPBA    'A',i
         BREQ    printa,i
         CPBA    'D',i
         BREQ    printd,i
         BR      error,i

error:   STRO    errorad,d
         BR      ad,i

printa:  LDWA    0,i
         STWA    num2,d
loopa:   LDWA    num2,d
         ADDA    1,i
         STWA    num2,d
         CPWA    num,d
         BRGT    done,i
         DECO    num2,d
         LDBA    firstn,d 
         CPBA    'P',i
         BREQ    firstP,i
         CPBA    'J',i
         BREQ    firstJ,i
         CPBA    'G',i
         BREQ    firstG,i    
         CPBA    'L',i
         BREQ    firstL,i

firstP:  STRO    peter,d
         LDBA    lastname,d
         CPBA    'G',i
         BREQ    lastG,i
         CPBA    'B',i
         BREQ    lastB,i
         CPBA    'S',i
         BREQ    lastS,i
         CPBA    'T',i
         BREQ    lastT,i

firstJ:  STRO    joe,d
         LDBA    lastname,d
         CPBA    'G',i
         BREQ    lastG,i
         CPBA    'B',i
         BREQ    lastB,i
         CPBA    'S',i
         BREQ    lastS,i
         CPBA    'T',i
         BREQ    lastT,i 

firstG:  STRO    glen,d
         LDBA    lastname,d
         CPBA    'G',i
         BREQ    lastG,i
         CPBA    'B',i
         BREQ    lastB,i
         CPBA    'S',i
         BREQ    lastS,i
         CPBA    'T',i
         BREQ    lastT,i 

firstL:  STRO    lois,d
         LDBA    lastname,d
         CPBA    'G',i
         BREQ    lastG,i
         CPBA    'B',i
         BREQ    lastB,i
         CPBA    'S',i
         BREQ    lastS,i
         CPBA    'T',i
         BREQ    lastT,i

lastG:   STRO   griffin,d
         LDBA    ad1,d       
         CPBA    'A',i
         BREQ    loopa,i
         CPBA    'D',i
         BREQ    loopd,i

lastB:   STRO    brown,d
         LDBA    ad1,d
         CPBA    'A',i
         BREQ    loopa,i
         CPBA    'D',i
         BREQ    loopd,i    
             
lastS:   STRO    swanson,d
         LDBA    ad1,d
         CPBA    'A',i
         BREQ    loopa,i
         CPBA    'D',i
         BREQ    loopd,i

lastT:   STRO    tucker,d
         LDBA    ad1,d
         CPBA    'A',i
         BREQ    loopa,i
         CPBA    'D',i
         BREQ    loopd,i

printd:  LDWA    num,d
         ADDA    1,i
         STWA    num2,d
loopd:   LDWA    num2,d
         SUBA    1,i
         STWA    num2,d
         CPWA    0,i
         BREQ    done,i
         DECO    num2,d
         LDBA    firstn,d 
         CPBA    'P',i
         BREQ    firstP,i
         CPBA    'J',i
         BREQ    firstJ,i
         CPBA    'G',i
         BREQ    firstG,i    
         CPBA    'L',i
         BREQ    firstL,i
                 
done:    STOP
         .end
                         


     
    
         
              
