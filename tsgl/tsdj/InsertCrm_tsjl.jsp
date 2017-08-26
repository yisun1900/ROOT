<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:setProperty name="cf" property="*" />
<%@ include file="/getlogin.jsp" %>

<html>
<head>
<title>录入数据</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<%
String slbm=(String)session.getAttribute("dwbh");
String yhmc=(String)session.getAttribute("yhmc");
String zdyhbz=(String)session.getAttribute("zdyhbz");
%>
<%

String khbh=null;
String khxm=null;
String fwdz=null;
String lxfs=null;
String qtdh=null;
String email=null;

String dwbh=null;
String dwmc=null;
String zjxm=null;
String sgd=null;
String sgdmc=null;
String sjs=null;
String hth=null;
String sgbz=null;
String sjkgrq=null;
String sjjgrq=null;
String ssfgs=null;

String djbh=null;
String hfdjbz=null;
String djyy=null;
String djsj=null;
String djr=null;
String jhjdsj=null;

String wherekhbh=null;
wherekhbh=cf.GB2Uni(request.getParameter("khbh"));
Connection conn  = null;
Statement stmt=null;
ResultSet rs=null;
String ls_sql=null;
String wheresql="";

int count=0;
//投诉记录号
String tsjlh=null;

String jcppbz="Y";

try {
	conn=cf.getConnection();
	stmt = conn.createStatement();
	ls_sql="select khbh,khxm,fwdz,lxfs,qtdh,crm_khxx.email,crm_khxx.dwbh,dwmc,sjs,crm_khxx.sgd,sgdmc,zjxm,hth,sjkgrq,sjjgrq,djbh,hfdjbz,djyy,djsj,djr,jhjdsj,sgbz,fgsbh";
	ls_sql+=" from  crm_khxx,sq_dwxx,sq_sgd";
	ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+) and khbh='"+wherekhbh+"'  ";
//	out.println(ls_sql);
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		khbh=cf.fillNull(rs.getString("khbh"));
		khxm=cf.fillNull(rs.getString("khxm"));
		fwdz=cf.fillNull(rs.getString("fwdz"));
		lxfs=cf.fillNull(rs.getString("lxfs"));
		qtdh=cf.fillNull(rs.getString("qtdh"));
		email=cf.fillNull(rs.getString("email"));
		dwbh=cf.fillNull(rs.getString("dwbh"));
		dwmc=cf.fillNull(rs.getString("dwmc"));
		sgd=cf.fillNull(rs.getString("sgd"));
		sgdmc=cf.fillNull(rs.getString("sgdmc"));
		zjxm=cf.fillNull(rs.getString("zjxm"));
		sjs=cf.fillNull(rs.getString("sjs"));
		hth=cf.fillNull(rs.getString("hth"));
		sjkgrq=cf.fillNull(rs.getDate("sjkgrq"));
		sjjgrq=cf.fillNull(rs.getDate("sjjgrq"));

		djbh=cf.fillNull(rs.getString("djbh"));
		hfdjbz=cf.fillNull(rs.getString("hfdjbz"));
		djyy=cf.fillNull(rs.getString("djyy"));
		djsj=cf.fillNull(rs.getDate("djsj"));
		djr=cf.fillNull(rs.getString("djr"));
		jhjdsj=cf.fillNull(rs.getDate("jhjdsj"));
		sgbz=cf.fillNull(rs.getString("sgbz"));
		ssfgs=cf.fillNull(rs.getString("fgsbh"));
	}
	rs.close();

	//是否启用集成订单
	ls_sql="select jcppbz";
	ls_sql+=" from  sq_dwxx";
	ls_sql+=" where dwbh='"+ssfgs+"'";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		jcppbz=cf.fillNull(rs.getString(1));
	}
	rs.close();

	ls_sql="select NVL(max(TO_NUMBER(substr(tsjlh,8,3))),0)";
	ls_sql+=" from  crm_tsjl";
	ls_sql+=" where khbh='"+wherekhbh+"'  ";
	rs =stmt.executeQuery(ls_sql);
	if (rs.next())
	{
		count=rs.getInt(1);
	}
	rs.close();

	tsjlh=wherekhbh+cf.addZero(count+1,3);
}
catch (Exception e) {
	out.print("Exception: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs != null) rs.close(); 
		if (stmt != null) stmt.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<body bgcolor="#FFFFFF">
<%
if (count>0)
{
	%>
	<table border="1" width="100%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
	<tr bgcolor="#CCCCCC"  align="center">
		<td  width="8%">来电登记</td>
		<td  width="8%">来电次数</td>
		<td  width="10%">发生时间</td>
		<td  width="8%">投诉来源</td>
		<td  width="8%">处理状态</td>
		<td  width="8%">需通知</td>
		<td  width="8%">部门处理</td>
		<td  width="42%">投诉报修内容</td>
	</tr>
	<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	ls_sql="SELECT tsjlh,khldcs,tsbxsj,slfsmc,DECODE(crm_tsjl.clzt,0,'未受理',1,'已受理',2,'在处理',3,'结案','9','不立案') as clzt,DECODE(crm_tsjl.sfxtz,'Y','需通知','N','不需通知') sfxtz,DECODE(crm_tsjl.zrbmclzt,'1','未接收','2','已接收等待出方案','D','已接收不需出方案','E','不属实','4','已接收等待出现场','6','已出现场等待出方案','7','已出方案等待审核','8','已出方案不需审核','9','方案审核通过','A','方案审核未通过','3','已解决','C','回访未解决','B','在处理','5','结案') zrbmclzt,tsnr";
	ls_sql+=" FROM crm_tsjl,dm_slfsbm";
    ls_sql+=" where crm_tsjl.slfsbm=dm_slfsbm.slfsbm and khbh='"+wherekhbh+"'  ";
	ls_sql+=" order by crm_tsjl.tsjlh";
//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//进行对象初始化
	pageObj.initPage("","","","lddj.jsp");
	pageObj.setPageRow(10000);//设置每页显示记录数
	pageObj.setEditStr("登记");

//设置显示列
	String[] disColName={"khldcs","tsbxsj","slfsmc","clzt","sfxtz","zrbmclzt","tsnr"};
	pageObj.setDisColName(disColName);

	pageObj.alignStr[6]="align='left'";

//设置列超级连接
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_tsjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("tsbxsj",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	coluParm=new ColuParm();//生成一个列参数对象
	String[] coluKey1={"tsjlh"};//设置列参数：coluParm.key的主键
	coluParm.key=coluKey1;//设置列参数：coluParm.key的主键
	coluParm.link="/tsgl/cx/ViewCrm_khldjl.jsp";//为列参数：coluParm.link设置超级链接
	coluParm.bolt="target='_blank'";//为列参数：coluParm.link设置超级链接
	coluParmHash.put("khldcs",coluParm);//列参数对象加入Hash表
	pageObj.setColuLink(coluParmHash);//列参数对象加入Hash表

	
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.displayDate();
}
%> 
</table>


<table width="100%" style="FONT-SIZE:12">
  <tr>
    <td width="100%"> 
      <div align="center"> 请录入投诉信息（投诉记录号：<%=tsjlh%>）</div>
    </td>
  </tr>
  <tr>
    <td width="100%" > 
      <div align="center">

<form method="post" action="" name="insertform" target="_blank">
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#E8E8FF"> 
              <td width="25%" align="left"> <font color="#0000CC">客户编号：</font><%=khbh%> 
              </td>
              <td width="25%"><font color="#0000CC">合同号：</font><%=hth%> </td>
              <td width="25%"> <font color="#0000CC">客户姓名：</font><%=khxm%></td>
              <td width="25%"><font color="#0000CC">质检员：</font><%=zjxm%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td colspan="2" align="left"><font color="#0000CC">房屋地址：</font><%=fwdz%> 
              </td>
              <td width="25%"><font color="#0000CC">实开工日期：</font><%=sjkgrq%> </td>
              <td width="25%"><font color="#0000CC">实交工日期：</font><%=sjjgrq%> </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="25%" align="left"><font color="#0000CC">签约店面：</font><%=dwmc%> 
              </td>
              <td width="25%"><font color="#0000CC">设计师：</font><%=sjs%> </td>
              <td width="25%"> <font color="#0000CC">施工队：</font><%=sgdmc%> </td>
              <td width="25%"><font color="#0000CC">施工班组：</font><%=sgbz%> </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td width="25%" align="left"><font color="#0000CC">回访冻结标志：</font><%
	cf.selectToken(out,"0+未冻结&1+工程回访冻结&2+投诉报修回访冻结&3+全部冻结",hfdjbz,true);
%> </td>
              <td width="25%"><font color="#0000CC">冻结人：</font><%=djr%> </td>
              <td width="25%"> <font color="#0000CC">冻结时间：</font><%=djsj%></td>
              <td width="25%"><font color="#0000CC">计划解冻时间：</font><%=jhjdsj%> 
              </td>
            </tr>
            <tr bgcolor="#CCFFCC"> 
              <td colspan="4" align="left"><font color="#0000CC">冻结原因：</font><%=djyy%> 
              </td>
            </tr>
          </table>
          <table width="100%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">联系方式</font></td>
              <td colspan="3"><%=lxfs%>
              <input type="button" value="修改联系方式" onClick="window.open('/khxx/EditLxfs.jsp?khbh=<%=khbh%>')"></td>
            </tr>
            
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#0000CC">电子邮件</font></td>
              <td colspan="3"><%=email%>          </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>投诉来源              </td>
              <td width="28%"> 
                <select name="slfsbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select slfsbm,slfsmc from dm_slfsbm order by slfsbm","");
%> 
                </select>              </td>
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>客户投诉时间              </td>
              <td width="38%"> 
                <input type="text" name="tsbxsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>客服受理人</td>
              <td width="28%"> 
                <input type="text" name="slr" value="<%=yhmc%>" size="20" maxlength="20">              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font>客服受理时间</td>
              <td width="38%"> 
                <input type="text" name="slsj" value="<%=cf.today()%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">录入人</font></td>
              <td width="28%"> 
                <input type="text" name="lrr" value="<%=yhmc%>" size="20" maxlength="20" readonly>              </td>
              <td width="17%" align="right"><font color="#FF0033">*</font><font color="#0000CC">录入时间</font></td>
              <td width="38%"> 
                <input type="text" name="lrsj" value="<%=cf.today()%>" size="20" maxlength="10" readonly>              </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right">客诉专员</td>
              <td><select name="kszy" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
                <%
	cf.selectItem(out,"select sq_yhxx.yhmc,sq_yhxx.yhmc||'（'||sq_yhxx.dh||'）' from sq_yhxx,sq_sqfgs where sq_yhxx.ygbh=sq_sqfgs.ygbh and sq_sqfgs.ssfgs='"+ssfgs+"' and sq_yhxx.zwbm='21' and sq_yhxx.sfzszg in('Y','N') order by yhmc","");
%>
              </select></td>
              <td align="right"><font color="#FF0033">*</font>客户来电次数</td>
              <td><input type="text" name="khldcs" value="1" size="20" maxlength="8"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉内容</td>
              <td colspan="3" bgcolor="#FFFFFF"> 
                <textarea name="tsnr" cols="66" rows="7"></textarea>              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>严重程度</td>
              <td width="28%"> 
                <select name="yzcdbm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                  <%
	cf.selectItem(out,"select yzcdbm,yzcdmc from dm_yzcdbm order by yzcdbm","");
%> 
                </select>              </td>
              <td width="17%" align="right">要求解决时间</td>
              <td width="38%"> 
                <input type="text" name="yqjjsj" value="" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>通知责任部门方式</td>
              <td width="28%"> 
                <input type="radio" name="sfxtz" value="Y">
                人工通知 
                <input type="radio" name="sfxtz" value="N" checked>
                自动通知 </td>
              <td width="17%" align="right"><font color="#FF0033">*</font>是否立案</td>
              <td width="38%"> 
                <input type="radio" name="sfla" value="Y" checked>
                是 
                <input type="radio" name="sfla" value="N">
                否 </td>
            </tr>
            <tr bgcolor="#FFFFFF">
              <td align="right"><font color="#FF0033">*</font>是否需内部跟踪</td>
              <td><input type="radio" name="sfxnbgz" value="Y" >
需回访
  <input name="sfxnbgz" type="radio" value="N" checked>
不需回访 </td>
              <td align="right">内部跟踪时间</td>
              <td><input name="nbgzsj" type="text" id="nbgzsj" onDblClick="JSCalendar(this)" size="20" maxlength="10"></td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right"> 
                <font color="#FF0033">*</font>是否需回访              </td>
              <td width="28%"> 
                <input type="radio" name="sfxhf" value="Y" checked>
                需回访 
                <input type="radio" name="sfxhf" value="N">
                不需回访 </td>
              <td width="17%" align="right"> 
                回访时间              </td>
              <td width="38%"> 
                <input type="text" name="hfsj" value="<%=cf.addDay(1)%>" size="20" maxlength="10" onDblClick="JSCalendar(this)">              </td>
            </tr>
            <tr bgcolor="#FFFFFF"> 
              <td width="17%" align="right">备注</td>
              <td colspan="3"> 
                <textarea name="bz" cols="66" rows="2"></textarea>              </td>
            </tr>
            <tr bgcolor="#E8E8FF" align="center"> 
              <td colspan="4"><b>注意：必须录入下述『投诉原因』，可通过『<font color="#0000CC">录入更多原因</font>』按钮录入多种原因</b></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉大类</td>
              <td width="28%"> 
                <select name="tslxbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getXlItem(insertform)">
                  <option value=""></option>
                  <%
	   cf.selectItem(out,"select tslxbm,tslxmc from dm_tslxbm where tsdl='2' order by tslxbm","");
%> 
                </select>              </td>
              <td width="17%" rowspan="6" align="right" valign="top">涉及厂商</td>
              <td width="38%" rowspan="6" valign="top"> 

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="xllb" >
					<tr>
					  <td >
						<select name="tspp" style="FONT-SIZE:12PX;WIDTH:252PX" >
						  <option value=""></option>
						</select>					  </td>
					</tr>
				  </table>

				  <table width="100%" border="0" cellpadding="0" cellspacing="0"  id="rglr" style="display:none">
					<tr>
					  <td >
						<input type="text" name="rglrtspp" size="34" maxlength="50" >					  </td>
					</tr>
			  </table>			  </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉小类</td>
              <td width="28%"> 
                <select name="tsxlbm" style="FONT-SIZE:12PX;WIDTH:152PX" onChange="getYyItem(insertform)">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right"><font color="#FF0033">*</font>投诉原因</td>
              <td width="28%"> 
                <select name="tsyybm" style="FONT-SIZE:12PX;WIDTH:152PX">
                  <option value=""></option>
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td width="17%" align="right"><font color="#FF0033">*</font>责任部门</td>
              <td width="28%">
                <select name="dwbh" style="FONT-SIZE:12PX;WIDTH:200PX" onChange="getZrbm(insertform)">
                  <option value=""></option>
                  <%
	String sql="select sq_tsclbm.dwbh,a.dwmc||'（'||b.dwmc||'）' from sq_tsclbm,sq_dwxx a,sq_dwxx b  where sq_tsclbm.dwbh=a.dwbh and a.ssfgs=b.dwbh and sq_tsclbm.ssfgs='"+ssfgs+"' order by sq_tsclbm.dwbh";
	cf.selectItem(out,sql,"");
%> 
                </select>              </td>
            </tr>
            <tr bgcolor="#E8E8FF">
              <td align="right"><font color="#FF0033">*</font>负责人</td>
              <td><select name="ygbh" style="FONT-SIZE:12PX;WIDTH:152PX">
                <option value=""></option>
              </select></td>
            </tr>
            <tr bgcolor="#E8E8FF"> 
              <td width="17%" align="right">涉及厂商</td>
              <td width="28%">

<%
	if (zdyhbz.equals("Y"))
	{
		%>
		<input type="radio" name="rglrbz" value="1" checked onClick="xllb.style.display ='block';rglr.style.display ='none';">
		从下拉列表选 
		<input type="radio" name="rglrbz" value="2" onClick="xllb.style.display ='none';rglr.style.display ='block';">
		人工录入 
		<%
	}
	else{
		%>
		<input type="radio" name="rglrbz" value="1" checked >
		从下拉列表选 
		<%
	}
%>              </td>
            </tr>
            <tr> 
              <td colspan="4" align="center"> 
                <input type="hidden" name="slbm" value="<%=slbm%>">
                <input type="hidden" name="tsjlh" value="<%=tsjlh%>">
                <input type="hidden" name="khbh" value="<%=khbh%>">
                <input type="hidden" name="ssfgs" value="<%=ssfgs%>">
                <input type="hidden" name="jcppbz" value="<%=jcppbz%>">
                <input type="button"  value="存盘" onClick="f_do(insertform)" name="bc">
                <input type="button"  value="录入更多原因" onClick="f_lr(insertform)" name="lr" disabled>
                <input type="button"  value="查看投诉原因" onClick="f_ck(insertform)" name="ck" disabled>
                <input type="button"  value="违反精益工程" onClick="window.open('/gcgl/jygcgl/jcgd/InsertGdm_gdjcjl.jsp?khbh=<%=khbh%>')" >
                <input type="reset"  value="重输" name="reset">              </td>
            </tr>
          </table>
</form>
	  </div>
    </td>
  </tr>
</table>
</body>
</html>
<SCRIPT language=javascript  src='/js/JSCalendar.js'></SCRIPT>
<SCRIPT language=javascript src="/js/validate.js"></SCRIPT>
<SCRIPT language=javascript >
<!--

<%
	//启用Ajax
	cf.ajax(out);
%>

var czlx;

function getXlItem(FormName)
{
	if (FormName.tslxbm.value=='')
	{
		return;
	}

	czlx=1;

	FormName.tsxlbm.length=1;
	FormName.tsyybm.length=1;
	FormName.tspp.length=1;
	FormName.dwbh.value="";

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tslxbm="+FormName.tslxbm.value;

//	window.open(actionStr);
	openAjax(actionStr);

}

function getYyItem(FormName)
{
	if (FormName.tsxlbm.value=='')
	{
		return;
	}

	czlx=2;

	FormName.tsyybm.length=1;

	var actionStr="/tsgl/tsdj/InsertCx.jsp?jcppbz=<%=jcppbz%>&ssfgs=<%=ssfgs%>&khbh=<%=khbh%>&tsxlbm="+FormName.tsxlbm.value;

//	window.open(actionStr);
	openAjax(actionStr);
}

function getZrbm(FormName)
{
	if (FormName.dwbh.value=='')
	{
		return;
	}

	FormName.ygbh.length=1;

	czlx=3;

	var sql="select ygbh,yhmc||'('||xzzwbm||')' from sq_yhxx where sq_yhxx.sfzszg in('Y','N') and dwbh='"+FormName.dwbh.value+"' order by yhmc";
	var actionStr="/ajax/selectstr.jsp?sql="+sql;
	
//	window.open(actionStr);
	openAjax(actionStr);
}



function getAjax(ajaxRetStr) 
{
	if (czlx==1)
	{
		insertform.tsxlbm.length=1;
		var value1=getStrValue(ajaxRetStr,1);
		strToSelect(insertform.tsxlbm,value1);
	}
	else if (czlx==2)
	{
		insertform.tsyybm.length=1;
		var value3=getStrValue(ajaxRetStr,3);
		strToSelect(insertform.tsyybm,value3);

		insertform.tspp.length=1;
		var value4=getStrValue(ajaxRetStr,4);
		strToSelect(insertform.tspp,value4);
	}
	else if (czlx==3)
	{
		strToSelect(insertform.ygbh,ajaxRetStr);
	}
}


function f_do(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请选择[投诉记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	if(	javaTrim(FormName.slfsbm)=="") {
		alert("请选择[投诉来源]！");
		FormName.slfsbm.focus();
		return false;
	}

	if(	javaTrim(FormName.tsnr)=="") {
		alert("请选择[投诉内容]！");
		FormName.tsnr.focus();
		return false;
	}

	if(FormName.tsnr.value.length>400)
	{
		var length=FormName.tsnr.value.length;
		alert("错误！[投诉内容]不能超过400个字，目前已有"+length+"个字，请简略录入");
		FormName.tsnr.focus();
		return false;
	}

	if(	javaTrim(FormName.yzcdbm)=="") {
		alert("请选择[严重程度]！");
		FormName.yzcdbm.focus();
		return false;
	}

	if(!(isDatetime(FormName.yqjjsj, "要求解决时间"))) {
		return false;
	}
	

	if(	!radioChecked(FormName.sfxtz)) {
		alert("请选择[需人工通知责任部门]！");
		FormName.sfxtz[0].focus();
		return false;
	}

	if(	!radioChecked(FormName.sfla)) {
		alert("请选择[是否立案]！");
		FormName.sfla[0].focus();
		return false;
	}
	if(	!radioChecked(FormName.sfxnbgz)) {
		alert("请选择[是否需内部跟踪]！");
		FormName.sfxnbgz[0].focus();
		return false;
	}
	if (FormName.sfxnbgz[0].checked)
	{
		if(	javaTrim(FormName.nbgzsj)=="") {
			alert("请输入[内部跟踪时间]！");
			FormName.nbgzsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.nbgzsj, "内部跟踪时间"))) {
			return false;
		}
	}
	else{
		FormName.nbgzsj.value="";
	}

	if(	!radioChecked(FormName.sfxhf)) {
		alert("请选择[是否需回访]！");
		FormName.sfxhf[0].focus();
		return false;
	}

	if (FormName.sfxhf[0].checked)
	{
		if(	javaTrim(FormName.hfsj)=="") {
			alert("请输入[回访时间]！");
			FormName.hfsj.focus();
			return false;
		}
		if(!(isDatetime(FormName.hfsj, "回访时间"))) {
			return false;
		}
	}
	else{
		FormName.hfsj.value="";
	}


	if(	javaTrim(FormName.tsbxsj)=="") {
		alert("请输入[客户投诉时间]！");
		FormName.tsbxsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.tsbxsj, "客户投诉时间"))) {
		return false;
	}
	if(	javaTrim(FormName.slr)=="") {
		alert("请输入[客服受理人]！");
		FormName.slr.focus();
		return false;
	}
	if(	javaTrim(FormName.slsj)=="") {
		alert("请输入[客服受理时间]！");
		FormName.slsj.focus();
		return false;
	}
	if(!(isDatetime(FormName.slsj, "客服受理时间"))) {
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
	if(	javaTrim(FormName.slbm)=="") {
		alert("请输入[录入部门]！");
		FormName.slbm.focus();
		return false;
	}

	if(	javaTrim(FormName.tslxbm)=="") {
		alert("请选择[投诉大类]！");
		FormName.tslxbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsxlbm)=="") {
		alert("请选择[投诉小类]！");
		FormName.tsxlbm.focus();
		return false;
	}
	if(	javaTrim(FormName.tsyybm)=="") {
		alert("请选择[投诉原因]！");
		FormName.tsyybm.focus();
		return false;
	}

	if(	javaTrim(FormName.dwbh)=="") {
		alert("请选择[责任部门]！");
		FormName.dwbh.focus();
		return false;
	}
	if(	javaTrim(FormName.ygbh)=="") {
		alert("请选择[负责人]！");
		FormName.ygbh.focus();
		return false;
	}


/*
	if (FormName.tslxbm.value=="12")
	{
		<%
		if (zdyhbz.equals("Y"))
		{
			%> 
			if (FormName.rglrbz[0].checked)//从下拉列表选
			{
				if(	javaTrim(FormName.tspp)=="") {
					alert("请从列表中选择[涉及厂商]，若列表中不存在，可选择【人工录入】！");
					FormName.tspp.focus();
					return false;
				}
			}
			else{
				if(	javaTrim(FormName.rglrtspp)=="") {
					alert("请人工录入[涉及厂商]！");
					FormName.rglrtspp.focus();
					return false;
				}
			}
			<%
		}
		else{
			%> 
			if(	javaTrim(FormName.tspp)=="") {
				alert("请从列表中选择[涉及厂商]！");
				FormName.tspp.focus();
				return false;
			}
			<%
		}
		%>
	}
*/

	if(	javaTrim(FormName.khldcs)=="") {
		alert("请选择[客户来电次数]！");
		FormName.khldcs.focus();
		return false;
	}
	if(!(isNumber(FormName.khldcs, "客户来电次数"))) {
		return false;
	}

	FormName.action="SaveInsertCrm_tsjl.jsp";
	FormName.submit();

	FormName.bc.disabled=true;
	FormName.lr.disabled=false;
	FormName.ck.disabled=false;
	return true;
}
function f_lr(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请选择[投诉记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	FormName.action="InsertCrm_tsbm.jsp";
	FormName.submit();
	return true;
}
function f_ck(FormName)//参数FormName:Form的名称
{
	if(	javaTrim(FormName.tsjlh)=="") {
		alert("请选择[投诉记录号]！");
		FormName.tsjlh.focus();
		return false;
	}
	FormName.action="Crm_tsbmList.jsp";
	FormName.submit();
	return true;
}
//-->
</SCRIPT>
