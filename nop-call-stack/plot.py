import plotly
import plotly.tools
import plotly.plotly as py
import plotly.graph_objs as go

plotly.tools.set_credentials_file(username='bollu', api_key='y9djKhCkikrAidL273xt')


# 10000, 20000, ...
c_times = [0. for _ in range(16)]
c_times[0] = 0.005
c_times[1] = 0.01
c_times[2] = 0.014
c_times[3] = 0.018
c_times[4] = 0.022
c_times[5] = 0.025
c_times[6] = 0.028
c_times[7] = 0.031

hs_times = [0 for _ in range(16)]
hs_times[0] = 0.005
hs_times[1] = 0.011
hs_times[2] = 0.016
hs_times[3] = 0.019
hs_times[4] = 0.022
hs_times[5] = 0.026
hs_times[6] = 0.030
hs_times[7] = 0.032


def plot_c_against_hs_equiv():
    data_hs = hs_times
    data_c = c_times

    trace_hs = go.Scatter(x=[10000 * x for x in range(1, 8)], y=data_hs, name="Haskell like C + clang O3")
    trace_c = go.Scatter(x=[10000 * x for x in range(1, 8)], y=data_c, name="Canonical C + clang O3")
    
    data = [trace_hs, trace_c]
    layout=go.Layout(title="C versus haskell equivalent: using the native stack versus heap-based continuation stack",
                     xaxis={'title':'number of call stacks used'},
                     yaxis={'title':'time (in seconds)'})
    figure=go.Figure(data=data,layout=layout)
    py.plot(figure, filename='using-native-call-stack-versus-cont-stack')



plot_c_against_hs_equiv()
