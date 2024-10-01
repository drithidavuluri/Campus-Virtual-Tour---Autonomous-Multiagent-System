// Auto-generated. Do not edit!

// (in-package campus_tour.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class NavigationRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.visitor_id = null;
      this.building_id = null;
    }
    else {
      if (initObj.hasOwnProperty('visitor_id')) {
        this.visitor_id = initObj.visitor_id
      }
      else {
        this.visitor_id = '';
      }
      if (initObj.hasOwnProperty('building_id')) {
        this.building_id = initObj.building_id
      }
      else {
        this.building_id = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type NavigationRequest
    // Serialize message field [visitor_id]
    bufferOffset = _serializer.string(obj.visitor_id, buffer, bufferOffset);
    // Serialize message field [building_id]
    bufferOffset = _serializer.string(obj.building_id, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type NavigationRequest
    let len;
    let data = new NavigationRequest(null);
    // Deserialize message field [visitor_id]
    data.visitor_id = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [building_id]
    data.building_id = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += _getByteLength(object.visitor_id);
    length += _getByteLength(object.building_id);
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'campus_tour/NavigationRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '2fa5e4010f01de8a50c1eaada5e59e13';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string visitor_id
    string building_id
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new NavigationRequest(null);
    if (msg.visitor_id !== undefined) {
      resolved.visitor_id = msg.visitor_id;
    }
    else {
      resolved.visitor_id = ''
    }

    if (msg.building_id !== undefined) {
      resolved.building_id = msg.building_id;
    }
    else {
      resolved.building_id = ''
    }

    return resolved;
    }
};

module.exports = NavigationRequest;
