class Pages {
  String page = "";

  String HOME = "HM";
  String VERIFICATION = "VR";
  String PROFILE = "PR";
  String REPORT = "RP";
  String SIGNOUT = "SO";

  boolean isHome () {
    return page.equals (HOME);
  }
  boolean isVerification () {
    return page.equals (VERIFICATION);
  }
  boolean isProfile () {
    return page.equals (PROFILE);
  }
  boolean isReport() {
    return page.equals (REPORT);
  }
  boolean isSignOut() {
    return page.equals(SIGNOUT);
  }
  void setHome () {
    page = HOME;
    homepageDraw();
  }
  void setVerification () {
    page = VERIFICATION;
    pageVerificationDraw();
  }
  void setProfile () {
    page = PROFILE;
    profilepageDraw();
  }
  void setReport () {
    page = REPORT;
    reportpageDraw();
  }
  void setSignout () {
    page = SIGNOUT;
    signoutpageDraw();
  }
}
