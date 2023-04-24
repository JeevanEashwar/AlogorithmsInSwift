import Foundation

// Definition of Interval
class Interval {
    var start: Int
    var end: Int
    init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

func canAttendMeetings(_ meetings: [Interval]) -> Bool {
    if meetings.count < 2 {
        return true
    }
    let sorterdMeetings = meetings.sorted { firstMeeting, secondMeeting in
        firstMeeting.start < secondMeeting.start
    }
    guard var previousMeeting = sorterdMeetings.first else {return false}
    for currentIndex in 1 ..< sorterdMeetings.count {
        let currentMeeting = sorterdMeetings[currentIndex]
        if currentMeeting.start < previousMeeting.end {
            return false
        }
        previousMeeting = currentMeeting
    }
    return true
}






