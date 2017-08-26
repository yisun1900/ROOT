<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>
<%String ckjgbz=(String)session.getAttribute("ckjgbz");%>
<%
String yhmc=(String)session.getAttribute("yhmc");
String yhdlm=(String)session.getAttribute("yhdlm");
String ssfgs=(String)session.getAttribute("ssfgs");
String yhjs=(String)session.getAttribute("yhjs");
String tzph = request.getParameter("tzph");
String dqbm = request.getParameter("dqbm");
String ckbh = request.getParameter("ckbh");
String clbmjh[]=request.getParameterValues("clbmlist");
String clbm=null;
String clmc=null;
String scph=null;
String scrq=null;
String zljb=null;
double kcsl=0;
String xh=null;
String bg1="E8E8FF";
String bg2="FFFFFF";
%>
<form method="post" action="saveInsertTzzljb.jsp" name="selectform" >
<input type="hidden" name="tzph"  value="<%=tzph%>" readonly>
<input type="hidden" name="dqbm"  value="<%=dqbm%>" readonly>
<input type="hidden" name="ckbh"  value="<%=ckbh%>" readonly>
<body bgcolor="#FFFFFF" align="center">
      <div align="center"><b> 质量级别调整（批号：<%=tzph%>）</b></div>
	  <center><a href="#" onClick="window.open('/jxc/bz/myclbm.jsp','center','width=400,height=350,top=300,left=350');" title="为何我的出库仓库不能显示？"><font size="-1"><b>帮助</b></font></a></center>
        <table width="100%" border="0" style="FONT-SIZE:14" bgcolor="#999999" cellpadding="1" cellspacing="1" align="center">
		<tr bgcolor="CCCCCC"> 
		    <td width="4%"> 
              <div align="center">序号</div>
            </td>
            <td width="7%"> 
              <div align="center">材料编码</div>
            </td>
			<td width="12%"> 
              <div align="center">名称</div>
            </td>
			<td width="12%"> 
              <div align="center">型号</div>
            </td>
			<td width="12%"> 
              <div align="center">生产批号</div>
            </td>
			<td width="12%"> 
              <div align="center">生产日期</div>
            </td>
			<td width="12%"> 
              <div align="center">质量级别</div>
            </td>
			<td width="7%"> 
              <div align="center">库存数量</div>
            </td>
			</td>
			<td width="7%"> 
              <div align="center">调整数量</div>
            </td>
			<td width="7%"> 
              <div align="center">调整后级别</div>
            </td>
           
          </tr>

<%
int i=0;
	Connection conn  = null;
	PreparedStatement ps=null;
	ResultSet rs=null;
	String ls_sql=null;
	try {
		conn=cf.getConnection();    //得到连接
		%>
		<tr bgcolor="#c0ffff" align="center"> 
			<td width="7%" colspan="10"> 
			 <div align="center"><font color="green">正常品</font></div>
            </td>            
          </tr>
		<%
		for (int k=0;k<clbmjh.length;k++)
		{
		clbm=clbmjh[k];
		//正常品
		ls_sql = " select clbm clbm,clmc,xh,scph,to_char(scrq,'YYYY-MM-DD') scrq,sum(jxc_kcb.kcsl) kcsl ";
		ls_sql+= " from jxc_kcb ";
		ls_sql +=" where  ";
		ls_sql +=" jxc_kcb.clbm='"+clbm+"' and jxc_kcb.dqbm='"+dqbm+"' and jxc_kcb.ckbh='"+ckbh+"' and zljb='1' ";
		ls_sql +=" group by clbm,clmc,xh,scph,to_char(scrq,'YYYY-MM-DD') ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			i++;
			kcsl=rs.getDouble("kcsl");
			clbm=cf.fillNull(rs.getString("clbm"));
			clmc=cf.fillNull(rs.getString("clmc"));
			xh=cf.fillNull(rs.getString("xh"));
			scph=cf.fillNull(rs.getString("scph"));
			scrq=cf.fillNull(rs.getString("scrq"));
			%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
              <div align="center"><%=i%></div>
			  </td>
		<td> 
              <div align="center"><input type="text" name="clbm" size="13" maxlength="13" value="<%=clbm%>" class=xian readonly>
			  </div>
            </td>
			<td> 
              <div align="center"><%=clmc%></div>
            </td>
			<td> 
              <div align="center"><%=xh%></div>
            </td>
			 <td > 
              <div align="center"><%=scph%></div>
			  <input type="hidden" name="scph"  value="<%=scph%>" readonly>
            </td>
			 <td > 
              <div align="center"><%=scrq%></div>
            </td>
			<td > 
              <div align="center"><font color="green">正常品</font></div>
			  <input type="hidden" name="yzljb"  value="1" size="8" readonly>
            </td>
			<td > 
              <div align="center"><input type="text" name="kcsl"  value="<%=kcsl%>" size="8" readonly></div>
            </td>
			<td > 
              <div align="center"><input type="text" name="tzsl" value="0" size="8"></div>
            </td>
			<td > 
              <div align="center">
			  <select name="xzljb" style="FONT-SIZE:12PX;WIDTH:82PX">
			  <option value="0"></option>
			  <option value="2">残次品</option>
			  <option value="3">报废品</option>
			  </select> 
  </select></div>
            </td>
          </tr>
	<%
		}
		rs.close();
		ps.close();
		}
		%>
		<tr bgcolor="#c0ffff" align="center"> 
			<td width="7%" colspan="10"> 
			 <div align="center"><font color="blue">残次品</font></div>
            </td>            
          </tr>
		<%
		for (int k=0;k<clbmjh.length;k++)
		{
		clbm=clbmjh[k];
		ls_sql = " select clbm clbm,clmc,xh,scph,to_char(scrq,'YYYY-MM-DD') scrq,sum(jxc_kcb.kcsl) kcsl ";
		ls_sql+= " from jxc_kcb ";
		ls_sql +=" where  ";
		ls_sql +=" jxc_kcb.clbm='"+clbm+"' and jxc_kcb.dqbm='"+dqbm+"' and jxc_kcb.ckbh='"+ckbh+"' and zljb='2' ";
		ls_sql +=" group by clbm,clmc,xh,scph,to_char(scrq,'YYYY-MM-DD') ";
		ps= conn.prepareStatement(ls_sql);
		rs=ps.executeQuery();
		if (rs.next())
		{
			i++;
			kcsl=rs.getDouble("kcsl");
			clbm=cf.fillNull(rs.getString("clbm"));
			clmc=cf.fillNull(rs.getString("clmc"));
			xh=cf.fillNull(rs.getString("xh"));
			scph=cf.fillNull(rs.getString("scph"));
			scrq=cf.fillNull(rs.getString("scrq"));
			%>
		<tr bgcolor="<%if (i%2==0){out.print(bg1);}else {out.print(bg2);}%>">
		<td> 
              <div align="center"><%=i%></div>
			  </td>
		<td> 
              <div align="center"><input type="text" name="clbm" size="10" maxlength="13" value="<%=clbm%>" class=xian readonly>
			  </div>
            </td>
			<td> 
              <div align="center"><%=clmc%></div>
            </td>
			<td> 
              <div align="center"><%=xh%></div>
            </td>
			 <td > 
              <div align="center"><%=scph%></div>
			  <input type="hidden" name="scph"  value="<%=scph%>" readonly>
            </td>
			 <td > 
              <div align="center"><%=scrq%></div>
            </td>
			<td > 
              <div align="center"><font color="blue">残次品</font></div>
			  <input type="hidden" name="yzljb"  value="2" size="8" readonly>
            </td>
			<td > 
              <div align="center"><input type="text" name="kcsl"  value="<%=kcsl%>" size="8" readonly></div>
            </td>
			<td > 
              <div align="center"><input type="text" name="tzsl" value="0" size="8"></div>
            </td>
			<td > 
              <div align="center">
			  <select name="xzljb" style="FONT-SIZE:12PX;WIDTH:82PX">
			  <option value="0"></option>
			  <option value="3">报废品</option>
			  </select> 
  </select></div>
            </td>
          </tr>
	<%
		}
		rs.close();
		ps.close();
		}
	}
	catch(Exception e){
		out.print("<BR>存盘失败,发生意外: " + e+ls_sql);
	}
	finally{
		try{
			if (rs!= null) rs.close(); 
			if (ps != null) ps.close(); 
			if (conn!=null) cf.close(conn);    //释放连接
		}
		catch (Exception e){}
	}
%>

<tr bgcolor="CCCCCC" align="center"> 
           <td width="4%"> 
              &nbsp;
            </td>
            <td width="7%"> 
              &nbsp;
            </td>
			<td width="12%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              &nbsp;
            </td>
			<td width="7%"> 
              <input type="button"  value=" 保 存 " onClick="f_do(selectform)">
            </td>
            
          </tr>
        </table>
		&nbsp;<br>
<center><span id="wcp">数据未存盘</span><font color="blue" ><span id="ycp"></span></font></center>
		</form>
		</body>
		</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--
function f_do(FormName)//参数FormName:Form的名称
{
	wcp.innerHTML="";
	ycp.innerHTML="您已经点击过存盘，如果失败请继续，如果成功请关闭本页！";
	FormName.submit();
	return true;
}

//-->
</SCRIPT>
