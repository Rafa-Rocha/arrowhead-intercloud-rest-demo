/*
 * This work is part of the Productive 4.0 innovation project, which receives grants from the
 * European Commissions H2020 research and innovation programme, ECSEL Joint Undertaking
 * (project no. 737459), the free state of Saxony, the German Federal Ministry of Education and
 * national funding authorities from involved countries.
 */

package eu.arrowhead.common.messages;

public class InterCloudAuthResponse {

  private boolean authorized;

  public InterCloudAuthResponse() {
  }

  public InterCloudAuthResponse(boolean isAuthorized) {
    this.authorized = isAuthorized;
  }

  public boolean isAuthorized() {
    return authorized;
  }

  public void setAuthorized(boolean isAuthorized) {
    this.authorized = isAuthorized;
  }

}
