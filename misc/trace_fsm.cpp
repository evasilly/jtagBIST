#include <iostream>
#include <vector>
#include <map>
#include <list>
#include <algorithm>
#include <string>
#include <fstream>

using namespace std;

string str_to_hex(string s) {
    if (s == "0000") return "0";
    if (s == "0001") return "1";
    if (s == "0010") return "2";
    if (s == "0011") return "3";
    if (s == "0100") return "4";
    if (s == "0101") return "5";
    if (s == "0110") return "6";
    if (s == "0111") return "7";
    if (s == "1000") return "8";
    if (s == "1001") return "9";
    if (s == "1010") return "A";
    if (s == "1011") return "B";
    if (s == "1100") return "C";
    if (s == "1101") return "D";
    if (s == "1110") return "E";
    if (s == "1111") return "F";
}

string int_to_hex(int s) {
    if (s == 0) return "0";
    if (s == 1) return "1";
    if (s == 2) return "2";
    if (s == 3) return "3";
    if (s == 4) return "4";
    if (s == 5) return "5";
    if (s == 6) return "6";
    if (s == 7) return "7";
    if (s == 8) return "8";
    if (s == 9) return "9";
    if (s == 10) return "A";
    if (s == 11) return "B";
    if (s == 12) return "C";
    if (s == 13) return "D";
    if (s == 14) return "E";
    if (s == 15) return "F";
}

string make_memadr(int a) {
    return int_to_hex(a/16) + int_to_hex(a%16);
}

string make_binary(int x) {
    string result = "0000";

    for(int i = 3; i >=0; i--) {
        result[i] = '0' + x % 2;
        x = x /2;
    }

    return result;
}

int isNonVisited(const vector<vector<pair<string,int>>>& fsm_table) {
    for (int i = 0; i < fsm_table.size(); i++) {
        for (auto elem : fsm_table[i]) {
            if (elem.second == 0)
                return i;
        }
    }
    return -1;
}

void BFS(const vector<vector<int>>& vertices, int src, int dst, vector<int>& result) {
    list<pair<int, int>> queue;
    list<pair<int, int>> path;

    int current = 0;
    int ancestor, tmp;
    bool *visited = new bool[vertices.size()];

    for (int i = 0; i < vertices.size(); i++) {
        visited[i] = false;
    }

    result.clear();

    queue.push_back(make_pair(src, -1));
    path.push_back(make_pair(src, -1));

    while(!queue.empty()) {
        current = queue.front().first;
        queue.pop_front();
        visited[current] = true;

        for (auto x : vertices[current]) {
            if (x == dst) {
                path.push_back(make_pair(x, current));
                queue.clear();
                break;
            }
            if (!visited[x]) {
                queue.push_back(make_pair(x, current));
                path.push_back(make_pair(x, current));
            }
        }
    }

    ancestor = path.back().second;
    current = path.back().first;
    path.pop_back();
    result.push_back(current);

    while(current != src) {
        tmp = path.back().first;
        if (tmp == ancestor) {
            ancestor = path.back().second;
            current = tmp;
            result.push_back(current);
        }
        path.pop_back();
    }

    reverse(result.begin(), result.end());
}

int main()
{
    vector<vector<pair<string,int>>> fsm_table; // with visited edge flag
    vector<vector<int>> vertices;
    vector<int> result_path;
    list<int> solution;
    std::ifstream infile("fsm.txt");
    string input_signature;
    int counter = 15;
    int state = 0;
    int previous_state = 0;
    bool currentNotVisited;

    while (!infile.eof()) {
        infile >> input_signature;
        counter ++;

        if (counter == 16) {
            counter = 0;
            fsm_table.push_back( vector<pair<string,int>>() );
            vertices.push_back( vector<int>());
        }

        if (input_signature != "-1") {
            fsm_table.back().push_back(make_pair(input_signature, 0));
            vertices.back().push_back(counter);
        } else {
            fsm_table.back().push_back(make_pair(input_signature, -1));
        }
    }

    while (state != -1) {
        currentNotVisited = false;

        // Есть ли в текущей вершине непройденные грани
        for (int i = 0; i < fsm_table[state].size(); i++) {
            currentNotVisited = (fsm_table[state][i].second == 0);
            if (currentNotVisited) {
                fsm_table[state][i].second = 1;
                state = i;
                cout << state << endl;
                solution.push_back(state);
                break;
            }
        }

        // Если таких граней нет, то
        if (!currentNotVisited) {
            previous_state = state;
            state = isNonVisited(fsm_table);
            if (state != -1) {
                BFS(vertices, previous_state, state, result_path);
                for (auto x : result_path){
                    if (x == previous_state)
                        continue;
                    fsm_table[previous_state][x].second = 1;
                    cout << x << endl;
                    previous_state = x;
                    solution.push_back(x);
                }
            }
        }
    }

    previous_state = 0;
    //int memaddr = 255 - solution.size();
    int memaddr = 0;
    while(!solution.empty()) { // INTEST code generation
        state = solution.front();
        solution.pop_front();

        // cout << fsm_table[previous_state][state].first << endl;
        cout << "SDR 5 TDI (0"<< str_to_hex(fsm_table[previous_state][state].first) << ");" << endl;
        cout << "SDR 5 TDI (1"<< str_to_hex(fsm_table[previous_state][state].first) << ") TDO ("<< str_to_hex(make_binary(previous_state)) << ");"<< endl;

//        cout << "memory["<< memaddr <<"] = 8'b"<< fsm_table[previous_state][state].first << make_binary(state) <<";" << endl;
//        cout << "SDR 16 TDI(" <<make_memadr(memaddr) << str_to_hex(fsm_table[previous_state][state].first) << int_to_hex(state) <<");" << endl;
//        memaddr++;

        previous_state = state;
    }

    for (int state_from = 0; state_from < fsm_table.size(); state_from++) {
        cout << "4'b"<< make_binary(state_from) <<": begin" << endl << "    casex(data_in)" << endl;
        for (int state_to = 0; state_to < fsm_table[state_from].size(); state_to++) {
            if (fsm_table[state_from][state_to].first != "-1") {
                cout << "        4'b" << fsm_table[state_from][state_to].first <<": state = 4'b" << make_binary(state_to) <<";" << endl;
            }
        }
        cout << "    endcase"<< endl << "end" << endl;
    }

    // cout << make_binary(14);

/*    for (auto elem : fsm_table) {
        for (auto x : elem) {
            cout << x.second << " ";
        }
        cout << endl;
    }*/

    return 0;
}