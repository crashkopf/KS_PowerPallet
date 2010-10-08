void DoGrate() { // call once per second
  pRatioReactor = (float)P_comb/(float)P_reactor;
  pRatioReactorHigh = (pRatioReactor < 0.3 && P_reactor < -200 && P_comb < -50);
  
  // if pressure ratio is "high" for a long time, shake harder
  if (pRatioReactorHigh) {
    grate_pratio_accumulator++;
  } else {
    grate_pratio_accumulator -= 5;
  }
  grate_pratio_accumulator = max(0,grate_pratio_accumulator); // don't let it go below 0
  
  // handle different shaking modes
  switch (grateMode) {
  case GRATE_SHAKE_ON:
    analogWrite(GRATE_MOTOR, 255);
    grate_motor_state = GRATE_MOTOR_LOW;
    break;
  case GRATE_SHAKE_OFF:
    analogWrite(GRATE_MOTOR,0);
    grate_motor_state = GRATE_MOTOR_OFF;
    break;
  case GRATE_SHAKE_PRATIO:
    if (grate_val >= GRATE_SHAKE_CROSS) { // not time to shake
      if (pRatioReactorHigh) {
        grate_val -= m_grate_high;
      } else {
        grate_val -= m_grate_low;
      }
      grate_motor_state = GRATE_MOTOR_OFF;
      analogWrite(GRATE_MOTOR,0);
    } else { //time to shake or reset
      if (grate_val >= 0) { //shake
        grate_val -= m_grate_on;
      } else { //reset
        grate_val = GRATE_SHAKE_INIT;
      }
      if (grate_pratio_accumulator < GRATE_PRATIO_THRESHOLD) {
        grate_motor_state = GRATE_MOTOR_LOW;
        analogWrite(GRATE_MOTOR,128);
      } else {
        grate_motor_state = GRATE_MOTOR_HIGH;
        analogWrite(GRATE_MOTOR,255);
      }
    }
    break;
  }
}
