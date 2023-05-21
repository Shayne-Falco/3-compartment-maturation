function Dynamic_FRAP(C,P,t)
    Cyb,Cyf,C1b,C1f,C2b,C2f = C
    α_1,α_2,α_3,α_4,α_5,α_6,α_7,n1,n2,C0 = P
    
    dC1b = C0^n1*((1-(C1b*B+C1f*F))/α_4)*Cyb*(C1b*B+C1f*F) - α_1*C1b
    dC1f = C0^n1*((1-(C1b*B+C1f*F))/α_4)*Cyf*(C1b*B+C1f*F) - α_1*C1f
    dC2b = α_3*C0^n2*((1-(C2b*B+C2f*F))/α_5)*Cyb*(C2b*B+C2f*F) - α_2*C2b
    dC2f = α_3*C0^n2*((1-(C2b*B+C2f*F))/α_5)*Cyf*(C2b*B+C2f*F) - α_2*C2f
    dCyb = -α_7*Cyb - dC1b - dC2b
    dCyf = α_6/(C0*F) -α_7*Cyf - dC1f - dC2f
    return [dCyb,dCyf,dC1b,dC1f,dC2b,dC2f]
    
end