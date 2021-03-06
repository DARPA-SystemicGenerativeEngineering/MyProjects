function [path] = simplePath(Map, InitState, GoalState)
    global EMPTY;
    global PREVPATH;
    global OBSTACLE;
    global NumRows;
    
    path   = InitState;
    
    curLoc = InitState;
        
    while curLoc(1) != GoalState(1) || curLoc(2) != GoalState(2)
        path = [path ; curLoc];
        
        goalDir = DirectionToGoal(curLoc, GoalState);
                        
        %Check if location is empty
        if Map( curLoc(2) + goalDir(2), curLoc(1) + goalDir(1) ) == EMPTY
            curLoc = curLoc + goalDir;
        else
            tempDir = [[1,0];[1,1];[0,1];[-1,1];[-1,0];[-1,-1];[0,-1];[1,-1]];
            i = 1;
            
            while Map( curLoc(2) + tempDir(i,2), curLoc(1) + tempDir(i,1)) != EMPTY
                i++;
            end
            curLoc = curLoc + tempDir(i);
        end
    end %end while loop    
    end