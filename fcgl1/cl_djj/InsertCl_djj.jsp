<%@ page contentType="text/html;charset=gb2312" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
String yhmc=(String)session.getAttribute("yhmc");
String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;

String fwmj=null;
String zjxm=null;
String sgd=null;
String sjs=null;
String hth=null;
String sgbz=null;
String kgrq=null;
String jgrq=null;
String qye=null;
String fgsbh=null;
String dwbh=null;

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;
String czxh=null;
String nian=null;
int maxbh=0;
String ls_sql=null;
Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
int count=0;
int cpsl=0;
try { 
	conn=cf.getConnection();

	ls_sql="select khbh,khxm,fwdz,lxfs,dwbh,sjs,sgd,zjxm,hth,kgrq,jgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,qye,fgsbh,fwmj";
	ls_sql+=" from  crm_khxx";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps= conn.prepareStatement(ls_sql);
	rs=ps.executeQuery();
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		sgd=cf.fillNull(rs.getString("sgd"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		kgrq=cf.fillNull(rs.getDate("kgrq"));
		jgrq=cf.fillNull(rs.getDate("jgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		qye=cf.fillNull(rs.getString("qye"));
		fgsbh=cf.fillNull(rs.getString("fgsbh"));
		fwmj=cf.fillNull(rs.getString("fwmj"));
	}
	rs.close();
	ps.close();


/***************************************************************\
|		检查是否做期末结转											|
\***************************************************************/


	ls_sql="select count(*) ";
	ls_sql+="  from cl_ydjz where  jzrq=TRUNC(LAST_DAY(ADD_MONTHS(SYSDATE,-1))) and dwbh='"+fgsbh+"' ";  
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);//从数据库中取出当前库存日期 
	} 
	rs.close();
	ps.close();

	if (count==0)
	{
		out.println("上月没有进行<a href=\"/fcgl/qmjz/ydjz.jsp\">库存结转</a>，不能进行库存操作！");
		return;
	}
//==================================查询最大操作序号=======================================================
	ls_sql="select NVL(max(substr(czxh,8,2)),0)";
	ls_sql+=" from  cl_djj";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();
	ps.close();

	czxh=wherekhbh+cf.addZero(count+1,2);

	ls_sql="select qye";
	ls_sql+=" from  cl_djj";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	ps=conn.prepareStatement(ls_sql);  
	rs=ps.executeQuery();
	if (rs.next())
	{
		qye=rs.getString(1);
	}
	rs.close();
	ps.close();

}
catch (Exception e) {
	out.print("存盘失败,发生意外: " + e);
	out.print("SQL=" + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		out.println("关闭连接发生以外,Exception:"+e.getMessage());
	}
}
%>
<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center">代金券管理（操作序号为：<%=czxh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户编号</font></div>
              </td>
              <td width="32%"> <%=khbh%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">合同号</font></div>
              </td>
              <td width="31%"> <%=hth%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">客户姓名</font></div>
              </td>
              <td width="32%"> <%=khxm%> </td>
              <td width="19%"> 
                <div align="right">联系方式</div>
              </td>
              <td width="31%"><%=lxfs%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">房屋地址</font></td>
              <td width="32%"><%=fwdz%></td>
              <td width="19%" align="right"><font color="#0000CC">质检员</font></td>
              <td width="31%"><%=zjxm%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">签约店面</font></td>
              <td width="32%"><%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+dwbh+"'",dwbh,true);
%></td>
              <td width="19%" align="right"><font color="#0000CC">设计师</font></td>
              <td width="31%"><%=sjs%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right">签约额</div>
              </td>
              <td width="32%"><%=qye%> </td>
              <td width="19%"> 
                <div align="right">房屋面积</div>
              </td>
              <td width="31%"><%=fwmj%></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%"> 
                <div align="right"><font color="#0000CC">施工队</font></div>
              </td>
              <td width="32%"> <%
	cf.selectItem(out,"select sgd,sgdmc from sq_sgd where sgd='"+sgd+"'",sgd,true);
%> </td>
              <td width="19%"> 
                <div align="right"><font color="#0000CC">施工班组</font></div>
              </td>
              <td width="31%"> <%=sgbz%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#0000CC">合同开工日期</font></td>
              <td width="32%" bgcolor="#FFFFFF"> <%=kgrq%> </td>
              <td width="19%" align="right"><font color="#0000CC">合同交工日期</font></td>
              <td width="31%"> <%=jgrq%> </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%" align="right"><font color="#CC0000">*</font>工程签约额</td>
              <td>
                <input type="text" name="qye" size="20" maxlength="10" value="<%=qye%>" >
              </td>
              <td width="15%" align="right">&nbsp;</td>
              <td>&nbsp; </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="15%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#000099">录入人</font></div>
              </td>
              <td> 
                <input type="text" name="lrr" size="20" maxlength="13" value="<%=yhmc%>" readonly>
              </td>
              <td width="15%"> 
                <div align="right"><font color="#CC0000">*</font><font color="#000099">录入时间</font></div>
              </td>
              <td> 
                <input type="text" name="lrsj" size="20" maxlength="10" value="<%=cf.today()%>" readonly>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right"><font color="#CC0000">*</font><font color="#000099">分公司</font></td>
              <td colspan="3"> 
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <%
	cf.selectItem(out,"select dwbh,dwmc from sq_dwxx where dwbh='"+fgsbh+"'","");
%> 
                </select>
              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="18%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="72" rows="3"></textarea>
              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="button"  value=" 存 盘 " name="bc" onClick="f_do(insertform)">
                <input type="reset"   value="查看库存" onClick="window.open('/fcgl/tjfx/kcfxList.jsp?fgs=<%=fgsbh%>')">
                <input type="button"  value="查看代金券明细" onClick="f_ck(insertform)" name="ck" disabled>
                <input type="button"  value="选择材料" onClick="f_lr(insertform)" name="lr" disabled>
                <input type="button"  value="修改" onClick="f_xg(insertform)" name="xg" disabled>
                <input type="button"  value=" 提 交 " onClick="f_tj(insertform)" name="tj" disabled>
                <input type="reset"  value=" 重 输 " name="reset">
                <input type="hidden" name="czxh" value="<%=czxh%>">
                <input type="hidden" name="khbh" value="<%=khbh%>" >
              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.qye)=="") {
		alert("请输入[工程签约额]！");
		FormName.qye.focus();
		return false;
	}
	if(!(isFloat(FormName.qye, "工程签约额"))) {
		return false;
	}
	if (parseFloat(FormName.qye.value)==0)
	{
		alert("[工程签约额]不能为0！");
		FormName.qye.select();
		return false;
	}

	if(	javaTrim(FormName.lrr)=="") {
		alert("请输入[录入人]！");
		FormName.lrr.focus();
		return false;
	}
	if(	javaTrim(FormName.lrsj)=="") {
		alert("请输入[录入时间]！");
		FormName.lrsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.lrsj, "录入时间"))) {
		return false;
	}

	FormName.action="SaveInsertCl_djj.jsp";
	FormName.submit();
	FormName.bc.disabled=true;
	FormName.ck.disabled=false;
	FormName.xg.disabled=false;
	FormName.lr.disabled=false;
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	FormName.action="SelectCxCl_clbm.jsp";
	FormName.submit();
	FormName.tj.disabled=false;
	return true;
}
function f_ck(FormName)//参数FormName:Form的名称
{
	FormName.action="UpdateDlCl_djj.jsp";
	FormName.submit();
	FormName.tj.disabled=false;
	return true;
}
function f_xg(FormName)//参数FormName:Form的名称
{
	FormName.action="Cl_djjmxList.jsp";
	FormName.submit();
	return true;
}
function f_tj(FormName)//参数FormName:Form的名称
{
	FormName.action="tjdjj.jsp?czxh="+FormName.czxh.value;
	FormName.lr.disabled=true;
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
