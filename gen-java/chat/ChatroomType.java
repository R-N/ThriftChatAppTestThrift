/**
 * Autogenerated by Thrift Compiler (0.9.3)
 *
 * DO NOT EDIT UNLESS YOU ARE SURE THAT YOU KNOW WHAT YOU ARE DOING
 *  @generated
 */
package chat;


import java.util.Map;
import java.util.HashMap;
import org.apache.thrift.TEnum;

public enum ChatroomType implements org.apache.thrift.TEnum {
  user(0),
  room(1),
  group(2);

  private final int value;

  private ChatroomType(int value) {
    this.value = value;
  }

  /**
   * Get the integer value of this enum value, as defined in the Thrift IDL.
   */
  public int getValue() {
    return value;
  }

  /**
   * Find a the enum type by its integer value, as defined in the Thrift IDL.
   * @return null if the value is not found.
   */
  public static ChatroomType findByValue(int value) { 
    switch (value) {
      case 0:
        return user;
      case 1:
        return room;
      case 2:
        return group;
      default:
        return null;
    }
  }
}
