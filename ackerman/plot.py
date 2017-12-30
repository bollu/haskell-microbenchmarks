import plotly
import plotly.tools
import plotly.plotly as py
import plotly.graph_objs as go

plotly.tools.set_credentials_file(username='bollu', api_key='y9djKhCkikrAidL273xt')


haskell_times = [0 for _ in range(15)]

haskell_times[8] = 0.007
haskell_times[9] = 0.03
haskell_times[10] = 0.14
haskell_times[11] = 0.60
haskell_times[12] = 2.53
haskell_times[13] = 10.87
haskell_times[14] = 52.56

c_times = [0 for _ in range(15)]
c_times[8] = 0.005
c_times[9] = 0.017
c_times[10] = 0.047
c_times[11] = 0.17
c_times[12] = 0.66
c_times[13] = 2.62
c_times[14] = 10.55

haskell_c_equiv_times = [0 for _ in range(16)]
haskell_c_equiv_times[8] = 0.006
haskell_c_equiv_times[9] = 0.020
haskell_c_equiv_times[10] = 0.062
haskell_c_equiv_times[11] = 0.232
haskell_c_equiv_times[12] = 0.913
haskell_c_equiv_times[13] = 3.66
haskell_c_equiv_times[14] = 14.655
haskell_c_equiv_times[15] = 59.09


def plot_c_against_hs():
    data_hs = haskell_times[8:]
    data_c = c_times[8:]

    trace_hs = go.Scatter(x=range(8, 15), y=data_hs, name="GHC")
    trace_c = go.Scatter(x=range(8, 15), y=data_c, name="clang")
    
    data = [trace_hs, trace_c]
    layout=go.Layout(title="C versus GHC: Ackermann",
                     xaxis={'title':'ackermann(3, x)'},
                     yaxis={'title':'time (in seconds)'})
    figure=go.Figure(data=data,layout=layout)
    py.plot(figure, filename='canonical-c-versus-ghc')
    py.offline.plot(figure, filename='canonical-c-versus-ghc')


def plot_hs_against_hs_equivalent():
    data_hs = haskell_times[8:]
    data_hs_equiv = haskell_c_equiv_times[8:]

    trace_hs = go.Scatter(x=range(8, 15), y=data_hs, name="C + clang O3"
    trace_hs_equiv = go.Scatter(x=range(8, 15), y=data_hs_equiv, name="Haskell-like-C + clang O3")
    
    data = [trace_hs, trace_hs_equiv]
    layout=go.Layout(title="C versus haskell-like-C",
                     xaxis={'title':'ackermann(3, x)'},
                     yaxis={'title':'time (in seconds)'})
    figure=go.Figure(data=data,layout=layout)
    py.plot(figure, filename='canonical-c-versus-haskell-like-c')
    # py.offline.plot(figure, filename='canonical-c-versus-ghc')
    pass

plot_hs_against_hs_equivalent()

