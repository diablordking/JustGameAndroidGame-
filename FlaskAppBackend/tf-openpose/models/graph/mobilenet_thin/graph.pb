node {
  name: "image"
  op: "Placeholder"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: -1
        }
        dim {
          size: 3
        }
      }
    }
  }
}
node {
  name: "Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "use_dropout"
  op: "PlaceholderWithDefault"
  input: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\003\000\000\000\030\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.15713484585285187
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.15713484585285187
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 24
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_0/weights"
  input: "MobilenetV1/Conv2d_0/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_0/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/kernel/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.004000000189989805
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/kernel/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_0/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/kernel/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_0/kernel/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_0/kernel/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/Conv2D"
  op: "Conv2D"
  input: "image"
  input: "MobilenetV1/Conv2d_0/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 24
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 24
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 24
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_0/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_0/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_0/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 24
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 24
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 24
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 24
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_0/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_0/Conv2D"
  input: "MobilenetV1/Conv2d_0/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_0/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_0/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_0/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_0/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\030\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1632993221282959
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1632993221282959
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 24
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\030\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_0/Relu"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\030\000\000\0000\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.28867512941360474
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.28867512941360474
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 24
        }
        dim {
          size: 48
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_1_pointwise/weights"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_1_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 48
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 48
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 48
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 48
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 48
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 48
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 48
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_1_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_1_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\0000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.11664237082004547
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.11664237082004547
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 48
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\0000\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_1_pointwise/Relu"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\0000\000\000\000`\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.20412415266036987
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.20412415266036987
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 48
        }
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_2_pointwise/weights"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_2_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_2_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_2_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08290266990661621
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08290266990661621
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_2_pointwise/Relu"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000`\000\000\000`\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1767766922712326
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1767766922712326
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 96
        }
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_3_pointwise/weights"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_3_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 96
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 96
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_3_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_3_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08290266990661621
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08290266990661621
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 96
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_3_pointwise/Relu"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000`\000\000\000\300\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14433756470680237
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14433756470680237
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 96
        }
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_4_pointwise/weights"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_4_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_4_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_4_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\300\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05877270922064781
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05877270922064781
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 192
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\300\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_4_pointwise/Relu"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\300\000\000\000\300\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.125
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.125
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 192
        }
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_5_pointwise/weights"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_5_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 192
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 192
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_5_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_5_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_5_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\300\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.05877270922064781
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.05877270922064781
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 192
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\300\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_5_pointwise/Relu"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\300\000\000\000\200\001\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10206207633018494
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10206207633018494
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 192
        }
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_6_pointwise/weights"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_6_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_6_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_6_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_6_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_6_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_6_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 384
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_6_pointwise/Relu"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\001\000\000\200\001\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 384
        }
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_7_pointwise/weights"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_7_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_7_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_7_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_7_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_7_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_7_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 384
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_7_pointwise/Relu"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\001\000\000\200\001\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 384
        }
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_8_pointwise/weights"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_8_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_8_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_8_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_8_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_8_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_8_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 384
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_8_pointwise/Relu"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\001\000\000\200\001\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 384
        }
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_9_pointwise/weights"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_9_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_9_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_9_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_9_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_9_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_9_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 384
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_9_pointwise/Relu"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\001\000\000\200\001\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 384
        }
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_10_pointwise/weights"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_10_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_10_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_10_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_10_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_10_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_10_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.04161251708865166
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 384
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\200\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "MobilenetV1/Conv2d_10_pointwise/Relu"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\200\001\000\000\200\001\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0883883461356163
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/max"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/mul"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 384
        }
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_11_pointwise/weights"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/weights/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_11_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/weights"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/Conv2D"
  op: "Conv2D"
  input: "MobilenetV1/Conv2d_11_depthwise/depthwise"
  input: "MobilenetV1/Conv2d_11_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 384
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 384
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "MobilenetV1/Conv2d_11_pointwise/Conv2D"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/Const"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/beta/read"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_mean/read"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "MobilenetV1/Conv2d_11_pointwise/Relu"
  op: "Relu"
  input: "MobilenetV1/Conv2d_11_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Conv2d_3_pool"
  op: "MaxPool"
  input: "MobilenetV1/Conv2d_3_pointwise/Relu"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "ksize"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 2
        i: 2
        i: 1
      }
    }
  }
}
node {
  name: "feat_concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "feat_concat"
  op: "ConcatV2"
  input: "Conv2d_3_pool"
  input: "MobilenetV1/Conv2d_7_pointwise/Relu"
  input: "MobilenetV1/Conv2d_11_pointwise/Relu"
  input: "feat_concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02776171639561653
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02776171639561653
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 864
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "feat_concat"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000`\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08040843904018402
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08040843904018402
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 864
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L1_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L1_1_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L1_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L1_2_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L1_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L1_3_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1369306445121765
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1369306445121765
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L1_4_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_4_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1527949720621109
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1527949720621109
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L1_4_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000&\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1428571492433548
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1428571492433548
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L1_5_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02776171639561653
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02776171639561653
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 864
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000`\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "feat_concat"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000`\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.08040843904018402
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.08040843904018402
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 864
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L2_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L2_1_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L2_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L2_2_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L2_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L2_3_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\000\001\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1369306445121765
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1369306445121765
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L2_4_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 256
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 256
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_4_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.1527949720621109
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.1527949720621109
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage1_L2_4_pointwise/Relu"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\000\001\000\000\023\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.14770978689193726
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.14770978689193726
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 256
        }
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage1_L2_5_depthwise/depthwise"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/Conv2D"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_concat"
  op: "ConcatV2"
  input: "Openpose/MConv_Stage1_L1_5_pointwise/BatchNorm/FusedBatchNorm"
  input: "Openpose/MConv_Stage1_L2_5_pointwise/BatchNorm/FusedBatchNorm"
  input: "feat_concat"
  input: "Openpose/MConv_Stage2_concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 921
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_concat"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\231\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 921
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L1_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L1_1_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L1_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L1_2_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L1_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L1_3_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L1_4_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_4_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L1_4_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000&\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24253562092781067
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24253562092781067
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L1_5_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 921
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_concat"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\231\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 921
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L2_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L2_1_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L2_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L2_2_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L2_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L2_3_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L2_4_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_4_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage2_L2_4_pointwise/Relu"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\023\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.2688664197921753
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.2688664197921753
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage2_L2_5_depthwise/depthwise"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/Conv2D"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_concat"
  op: "ConcatV2"
  input: "Openpose/MConv_Stage2_L1_5_pointwise/BatchNorm/FusedBatchNorm"
  input: "Openpose/MConv_Stage2_L2_5_pointwise/BatchNorm/FusedBatchNorm"
  input: "feat_concat"
  input: "Openpose/MConv_Stage3_concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 921
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_concat"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\231\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 921
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L1_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L1_1_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L1_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L1_2_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L1_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L1_3_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L1_4_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_4_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L1_4_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000&\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.24253562092781067
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.24253562092781067
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L1_5_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 38
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 38
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 921
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_concat"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\231\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 921
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L2_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L2_1_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L2_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L2_2_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L2_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L2_3_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L2_4_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_4_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage3_L2_4_pointwise/Relu"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\023\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.2688664197921753
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.2688664197921753
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage3_L2_5_depthwise/depthwise"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 19
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 19
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/Conv2D"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_concat/axis"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
        }
        int_val: 3
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_concat"
  op: "ConcatV2"
  input: "Openpose/MConv_Stage3_L1_5_pointwise/BatchNorm/FusedBatchNorm"
  input: "Openpose/MConv_Stage3_L2_5_pointwise/BatchNorm/FusedBatchNorm"
  input: "feat_concat"
  input: "Openpose/MConv_Stage4_concat/axis"
  attr {
    key: "N"
    value {
      i: 3
    }
  }
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "Tidx"
    value {
      type: DT_INT32
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.02688988298177719
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 921
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000\231\003\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage4_concat"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000\231\003\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.07804723083972931
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 921
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage4_L1_1_depthwise/depthwise"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/Conv2D"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_1_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage4_L1_1_pointwise/Relu"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage4_L1_2_depthwise/depthwise"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/Conv2D"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_2_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.10127393901348114
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 3
        }
        dim {
          size: 3
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\003\000\000\000\003\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage4_L1_2_pointwise/Relu"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.21650634706020355
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/Conv2D"
  op: "Conv2D"
  input: "Openpose/MConv_Stage4_L1_3_depthwise/depthwise"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
  attr {
    key: "use_cudnn_on_gpu"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/Const"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 0.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean/Initializer/zeros"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
          dim {
            size: 64
          }
        }
        float_val: 1.0
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 64
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance/Initializer/ones"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  op: "FusedBatchNorm"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/Conv2D"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/Const"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/beta/read"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_mean/read"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/moving_variance/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "epsilon"
    value {
      f: 0.001
    }
  }
  attr {
    key: "is_training"
    value {
      b: false
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/Const_1"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.0010000000474974513
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_3_pointwise/Relu"
  op: "Relu"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/BatchNorm/FusedBatchNorm"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: -0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 0.3038218021392822
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  op: "RandomUniform"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/shape"
  attr {
    key: "T"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "seed"
    value {
      i: 0
    }
  }
  attr {
    key: "seed2"
    value {
      i: 0
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  op: "Sub"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/max"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/RandomUniform"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/sub"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  op: "Add"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/mul"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform/min"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
  op: "VariableV2"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "container"
    value {
      s: ""
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "shape"
    value {
      shape {
        dim {
          size: 1
        }
        dim {
          size: 1
        }
        dim {
          size: 64
        }
        dim {
          size: 1
        }
      }
    }
  }
  attr {
    key: "shared_name"
    value {
      s: ""
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Assign"
  op: "Assign"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Initializer/random_uniform"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "use_locking"
    value {
      b: true
    }
  }
  attr {
    key: "validate_shape"
    value {
      b: true
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/read"
  op: "Identity"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
        tensor_shape {
        }
        float_val: 3.9999998989515007e-05
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  op: "L2Loss"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer"
  op: "Mul"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/scale"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/Regularizer/l2_regularizer/L2Loss"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise/Shape"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise/dilation_rate"
  op: "Const"
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 2
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise"
  op: "DepthwiseConv2dNative"
  input: "Openpose/MConv_Stage4_L1_3_pointwise/Relu"
  input: "Openpose/MConv_Stage4_L1_4_depthwise/depthwise_weights/read"
  attr {
    key: "T"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "data_format"
    value {
      s: "NHWC"
    }
  }
  attr {
    key: "padding"
    value {
      s: "SAME"
    }
  }
  attr {
    key: "strides"
    value {
      list {
        i: 1
        i: 1
        i: 1
        i: 1
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_pointwise/weights/Initializer/random_uniform/shape"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_INT32
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_INT32
        tensor_shape {
          dim {
            size: 4
          }
        }
        tensor_content: "\001\000\000\000\001\000\000\000@\000\000\000@\000\000\000"
      }
    }
  }
}
node {
  name: "Openpose/MConv_Stage4_L1_4_pointwise/weights/Initializer/random_uniform/min"
  op: "Const"
  attr {
    key: "_class"
    value {
      list {
        s: "loc:@Openpose/MConv_Stage4_L1_4_pointwise/weights"
      }
    }
  }
  attr {
    key: "dtype"
    value {
      type: DT_FLOAT
    }
  }
  attr {
    key: "value"
    value {
      tensor {
        dtype: DT_FLOAT
    }