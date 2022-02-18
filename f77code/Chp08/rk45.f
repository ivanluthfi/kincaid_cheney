C
C PAGE 326: NUMERICAL MATHEMATICS AND COMPUTING, CHENEY/KINCAID, 1985
C
C FILE: RK45.FOR
C
C RUNGE-KUTTA-FEHLBERG METHOD FOR SOLVING AN INITIAL VALUE PROBLEM (RK45,F)  
C
      SUBROUTINE RK45(F,T,X,H,EST)    
      DATA  C21,C31,C32, C41,C42,C43, C51,C52,C53,C54,    
     A      C61,C62,C63,C64,C65, A1,A3,A4,A5, B1,B3,B4,B5, B6, C40  
     B  /0.25,0.09375,0.28125,
     C  0.87938097405553,-3.2771961766045,3.3208921256258,
     D  2.0324074074074,-8.0,7.1734892787524,-0.20589668615984,     
     E  -0.2962962962963,2.0,-1.3816764132554,0.45297270955166,-0.275,
     F  0.11574074074074,0.54892787524366,0.5353313840156,-0.2,     
     G  0.11851851851852,0.51898635477583,0.50613149034201,-0.18,   
     H  0.036363636363636, 0.92307692307692/    
      F1 = H*F(T,X) 
      F2 = H*F(T+ 0.25*H,X + C21*F1)  
      F3 = H*F(T+0.375*H,X + C31*F1 + C32*F2)   
      F4 = H*F(T+C40*H,X + C41*F1 + C42*F2 + C43*F3)  
      F5 = H*F(T+H    ,X + C51*F1 + C52*F2 + C53*F3 + C54*F4)       
      F6 = H*F(T+0.5*H,X + C61*F1 + C62*F2 + C63*F3 + C64*F4 + C65*F5)
      X5 = X + B1*F1 + B3*F3 + B4*F4 + B5*F5 + B6*F6      
      X  = X + A1*F1 + A3*F3 + A4*F4 + A5*F5    
      T = T + H   
      EST = ABS(X - X5)     
      RETURN      
      END 
  
      EXTERNAL F
      DATA T/1.0/, X/2.0/, H/7.8125E-3/, NSTEP/72/
      PRINT *,T,X 
      DO 2 I=1,NSTEP
      CALL RK45(F,T,X,H,EST)
      PRINT *,T,X,EST 
   2  CONTINUE
      STOP
      END 
  
      FUNCTION F(T,X) 
      F = 2.0+(X-T-1.0)**2  
      RETURN
      END 