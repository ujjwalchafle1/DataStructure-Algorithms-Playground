import Cocoa
let serialQueue1     = DispatchQueue(label: "my queue")
let serialQueue     = DispatchQueue(label: "my queue")
let concurrentQueue = DispatchQueue(label: "my queue1", attributes: .concurrent)

serialQueue1.sync
{
  serialQueue.async {
    print("This is async serial")
    concurrentQueue.async {
      print("This is async concurrent1")
    }
    concurrentQueue.async {
      print("This is async concurrent2")
    }
  }

  print("2")

  serialQueue.sync {
    print("This is sync serial")
  }

  concurrentQueue.async {
    print("This is async concurrent")
  }

  concurrentQueue.sync {
    print("This is sync concurrent")
  }
}


class MyClass
{
  func actionOne() {
    let queue = DispatchQueue(label: "queue", attributes: .concurrent)
    queue.async {
      DispatchQueue.main.async { [unowned self] in
        print("async started")
        self.timeIntensiveTask()
        print("async ended")
      }
    }
    
    print("sync task started")
    timeIntensiveTask()
    print("sync task ended")
  }
  
  func timeIntensiveTask() {
    var counter = 0
    for _ in 0..<10000 {
      counter += 1
    }
  }
}

let myclass = MyClass()
myclass.actionOne()
