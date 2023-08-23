#include<iostream>
using namespace std;

// Function to find the waiting time
void findWait_Time(int processes[], int size, int burst_time[],
								int wait_t[], int arrival_t[])
{
	int service_time[size];
	service_time[0] = arrival_t[0];
	wait_t[0] = 0;

	int i = 1;

	// calculating waiting time
	while ( i < size )
	{
		// Add burst time of previous processes
		service_time[i] = service_time[i-1] + burst_time[i-1];

		//waiting time = sum - at[i]
		wait_t[i] = service_time[i] - arrival_t[i];

		if (wait_t[i] < 0)
			wait_t[i] = 0;

		i++;
	}
}


// Function to calculate average waiting time
void findavg_wait_Time(int processes[], int size, int burst_t[], int arrival_t[])
{
	int wt[size], tat[size];

	findWait_Time(processes, size, burst_t, wt, arrival_t);

	// Display processes along with all details
	cout << "\nProcesses " << " Burst Time " << " Arrival Time "
		<< " Waiting Time \n";
	int total_wt = 0, total_tat = 0;

	int i = 0;
	while (i < size)
	{
		total_wt = total_wt + wt[i];
		total_tat = total_tat + tat[i];
		int compl_time = tat[i] + arrival_t[i];
		cout << " " << processes[i] << "\t\t" << burst_t[i] << "\t\t"
			<< arrival_t[i] << "\t\t" << wt[i] << "\t\t "
			 << endl;

		i++;
	}

	cout << "\nAverage waiting time = "
		<< (float)total_wt / (float)size<<endl;

     // Printing the Gantt Chart
    cout << "\nGantt Chart:\n";
    int timeline = arrival_t[0];
    for (int i = 0; i < size; i++)
    {
        cout << "|  P" << processes[i] << "  |";
        timeline += burst_t[i];
    }
    cout << endl;
    timeline = arrival_t[0];
    for (int i = 0; i < size; i++)
    {
        cout << "  " << timeline << "\t";
        timeline += burst_t[i];
    }
    cout << timeline << endl;

}


// Driver code
int main()
{
	int processes[] = {4, 3, 1, 5, 2};
	int n = sizeof processes / sizeof processes[0];
	/*cout<<"Enter Number of processes: ";
    int n;
    cin>>n;
    int processes[n];
    int arrival_time[n];
    int burst_time[n];

    cout<<"Enter process's id: ";
    for(int i=0;i<n;i++){
        cin>>processes[i];
    }*/

	int arrival_time[] = {0, 1, 2, 4, 5};
	/*cout<<"Enter arrival time: ";
	for(int i=0;i<n;i++){
        cin>>arrival_time[i];
    }*/

	int burst_time[] = {3, 8, 6, 4, 2};
	/*cout<<"Enter burst time: ";
	for(int i=0;i<n;i++){
        cin>>burst_time[i];
    }*/

	findavg_wait_Time(processes, n, burst_time, arrival_time);

	return 0;
}
