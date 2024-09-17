//Задача - представьте, что абстрактный джун прислал вам этот файл. Проведите код ревью так, что бы джуну было понятно, что он сделал не так, что исправить и как было бы лучше ему поступить в следующий раз.
//Задача ориентирована на 1 час времени и является опциональной к выполнению. Однако, согласиться или отказаться нужно заранее. Выполненное задание должно быть передано на проверку не позднее, чем за 2 часа до собеседования.

/// Please imagine your regular work's day and do the code review

import Foundation


let filePath = Bundle.main.path(forResource: "myOrders.csv", ofType: nil)
let orderReader = OrderReader(reader: Reader(delegate: ReaderDelegate()))
orderReader.read(URL(fileURLWithPath: filePath ?? ""))



