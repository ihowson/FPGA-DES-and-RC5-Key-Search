#include <vector>
#include "iflib.h"

using namespace std;

class KeySearch2;
class SearchUnit;

class KeySearch2 {
 public:
    KeySearch2();
    ~KeySearch2();

    int getVersion();

    void setPlainText(int msw, int lsw);
    void setCipherText(int msw, int lsw);
    void setIV(int msw, int lsw);
    int getKey(int index);
    int getUnitCount();
    SearchUnit& operator[](const int&);

    void writeBuffer(int addr, int msw, int lsw);
    int64 readBuffer(int addr);
 protected:
    void wait_ready();
    static char* pil_addr(int addr);
    int numunits;
    int version;
    vector<SearchUnit*> units;
    void setWord(int addr, int msw, int lsw);
    int64 getWord(int addr);
    int64 readBuffer();
};

class SearchUnit {
 public:
    SearchUnit(const int& i, KeySearch2* keysearch);
    void setBlock(int msw, int lsw);
    int64 getBlock();
    int getKey();
    int getStatus();
    bool gotMatch();
    bool isRunning();
    bool hasKey();
    void restart();

 protected:
    int index;
    KeySearch2* ks;
    int blockm, blockl;
};
