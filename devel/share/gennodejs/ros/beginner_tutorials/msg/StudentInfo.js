// Auto-generated. Do not edit!

// (in-package beginner_tutorials.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class StudentInfo {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.name = null;
      this.age = null;
      this.gpa = null;
      this.student_id = null;
    }
    else {
      if (initObj.hasOwnProperty('name')) {
        this.name = initObj.name
      }
      else {
        this.name = '';
      }
      if (initObj.hasOwnProperty('age')) {
        this.age = initObj.age
      }
      else {
        this.age = 0;
      }
      if (initObj.hasOwnProperty('gpa')) {
        this.gpa = initObj.gpa
      }
      else {
        this.gpa = 0.0;
      }
      if (initObj.hasOwnProperty('student_id')) {
        this.student_id = initObj.student_id
      }
      else {
        this.student_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type StudentInfo
    // Serialize message field [name]
    bufferOffset = _serializer.string(obj.name, buffer, bufferOffset);
    // Serialize message field [age]
    bufferOffset = _serializer.int32(obj.age, buffer, bufferOffset);
    // Serialize message field [gpa]
    bufferOffset = _serializer.float32(obj.gpa, buffer, bufferOffset);
    // Serialize message field [student_id]
    bufferOffset = _serializer.string(obj.student_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type StudentInfo
    let len;
    let data = new StudentInfo(null);
    // Deserialize message field [name]
    data.name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [age]
    data.age = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [gpa]
    data.gpa = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [student_id]
    data.student_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.name);
    length += _getByteLength(object.student_id);
    return length + 16;
  }

  static datatype() {
    // Returns string type for a message object
    return 'beginner_tutorials/StudentInfo';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c051919ed71c86bd1ae31babca56f15c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string name
    int32 age
    float32 gpa
    string student_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new StudentInfo(null);
    if (msg.name !== undefined) {
      resolved.name = msg.name;
    }
    else {
      resolved.name = ''
    }

    if (msg.age !== undefined) {
      resolved.age = msg.age;
    }
    else {
      resolved.age = 0
    }

    if (msg.gpa !== undefined) {
      resolved.gpa = msg.gpa;
    }
    else {
      resolved.gpa = 0.0
    }

    if (msg.student_id !== undefined) {
      resolved.student_id = msg.student_id;
    }
    else {
      resolved.student_id = ''
    }

    return resolved;
    }
};

module.exports = StudentInfo;
