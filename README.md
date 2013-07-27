UIDriveByEvents
===============

UITableview Events

===============
owner : paradiselwh154@gmail.com


什么是事件驱动？
===============
        所谓事件驱动，简单地说就是你点什么按钮（即产生什么事件），电脑执行什么操作（即调用什么函数）.
        当然事件不仅限于用户的操作. 事件驱动的核心自然是事件。
        UITableView想必大家都比较熟悉了。
        使用时候要实现2个delegate， dataSource delegate和tableView delegate。
        有人说了，每次调用其他类的方法都是要写delegate挺麻烦，不方便。
        后来有些高手说，大家可以试用block来代替么比较方便。可是block许多新手还不是很会使用。
        今天我的demo主要是讲的事件机制。


  此demo只是抛砖引玉，如果大家从底层封装了一个事件机制，可能用起来会更加方便，形成自己的ui framework。
