<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	String xtrzyhdlm=(String)session.getAttribute("yhdlm");
	String yhqx=cf.executeQuery("select count(*)  from v_sqxx where yhdlm='"+xtrzyhdlm+"' and cdbh='17030104'");
	if (yhqx.equals("0"))
	{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'���棡�Ƿ�����[���ʦ��ֵͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);

		session.setAttribute("yhdlm",null);
		return;
	}
	else{
		String xtrzip=request.getRemoteHost();
		String xtrzyhmc=(String)session.getAttribute("yhmc");

		String sql="insert into sq_ckxxrz ( xh,ip,yhdlm,yhmc,dlsj,bz ) ";
		sql+=" values ( (select NVL(max(xh),0)+1 from sq_ckxxrz),'"+xtrzip+"','"+xtrzyhdlm+"','"+xtrzyhmc+"',SYSDATE,'����[���ʦ��ֵͳ��]��"+xtrzyhmc+"') ";
		cf.executeUpdate(sql);
	}
%>


<%
ybl.common.PageObject pageObj=new ybl.common.PageObject();
String xsfg=request.getParameter("xsfg");
if (xsfg.equals("2"))
{
	pageObj.setType("EXCEL",response);
}

String sjfw=request.getParameter("sjfw");
String sjfw2=request.getParameter("sjfw2");

String fgs=request.getParameter("fgs");
String dwbh=request.getParameter("dwbh");
String sjs=cf.GB2Uni(request.getParameter("sjs"));

String wheresql="";
String wheresql1="";

String ygbh=(String)session.getAttribute("ygbh");
String kfgssq=(String)session.getAttribute("kfgssq");//1�����ֹ�˾��Ȩ��2����������Ȩ��3������Ȩ

if (kfgssq.equals("1") || kfgssq.equals("2"))//0������Ȩ��1����Ȩ�����ֹ�˾��2����Ȩ����ֹ�˾��3����Ȩ�������棻4����Ȩĳһ�ֹ�˾������棻5����Ȩ����ֹ�˾�������
{
	wheresql+=" and crm_khxx.fgsbh in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.ssfgs in(select ssfgs from sq_sqfgs where ygbh='"+ygbh+"' )";
}
else
{
	wheresql+=" and crm_khxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
	wheresql1+=" and sq_yhxx.dwbh in(select dwbh from sq_sqbm where ygbh='"+ygbh+"' )";
}

if (!(fgs.equals("")))
{
	wheresql+=" and  (crm_khxx.fgsbh='"+fgs+"')";
	wheresql1+=" and  (sq_yhxx.ssfgs='"+fgs+"')";
}
if (!(dwbh.equals("")))	
{
	wheresql+=" and  crm_khxx.dwbh='"+dwbh+"'";
	wheresql1+=" and  sq_yhxx.dwbh='"+dwbh+"'";
}
if (!(sjs.equals("")))	
{
	wheresql+=" and  crm_khxx.sjs='"+sjs+"'";
}


String getsjs=null;
String olddm="";
String dwmc=null;

String getdwbh=null;

int qys=0;
double wdzgce=0;
double qye=0;

double zqgczjf=0;
double zhgczjf=0;

double zqguanlif=0;
double guanlif=0;

double zqsuijin=0;
double suijin=0;

double zqqtsf=0;
double zhqtsf=0;

double zqwjrqyexm=0;
double zhwjrqyexm=0;

double zqsjf=0;
double sjf=0;

long fwmj=0;

double suijinze=0;


int ALLqys=0;
double ALLwdzgce=0;
double ALLqye=0;

double ALLzqgczjf=0;
double ALLzhgczjf=0;

double ALLzqguanlif=0;
double ALLguanlif=0;

double ALLzqsuijin=0;
double ALLsuijin=0;

double ALLzqqtsf=0;
double ALLzhqtsf=0;

double ALLzqwjrqyexm=0;
double ALLzhwjrqyexm=0;

double ALLzqsjf=0;
double ALLsjf=0;


long ALLfwmj=0;

double ALLsuijinze=0;



double zkl=0;
int pjde=0;
int pmjj=0;


int gsskqys=0;
int cwskqys=0;
double jzssk=0;
double khssk=0;

int ALLgsskqys=0;
int ALLcwskqys=0;
double ALLjzssk=0;
double ALLkhssk=0;


int row=0;

String bgcolor="#FFFFFF";

Connection conn  = null;
PreparedStatement ps=null;
ResultSet rs=null;
PreparedStatement ps1=null;
ResultSet rs1=null;
String ls_sql=null;
try {
	conn=cf.getConnection();
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 14px'>
<CENTER >
  <B>���ʦǩ��ͳ��<BR>
  (ǩԼʱ�䣺<%=sjfw%>--<%=sjfw2%>)</B> 
</CENTER>
<form method="POST" name="listform" action="" target="_blank">


<table width="310%" border="0" style="FONT-SIZE:12" bgcolor="#999999" cellpadding="2" cellspacing="2">
<TR bgcolor="#CCCCCC"  align="center"  > 
  <td  width="2%" >����</td>
  <td  width="3%" >���ʦ</td>
  <td  width="6%" >����</td>

  <td  width="3%" >ǩԼ��</td>
  <td  width="5%" >��ǰ����ͬ��</td>
  <td  width="3%" >�ۺ��ۿ�</td>
  <td  width="5%" >�ۺ󣭺�ͬ��</td>

  <td  width="2%" >���տ�ͻ���</td>
  <td  width="2%" >�����������</td>

  <td  width="5%" ><font color="#0000FF">��װʵ�տ�</font></td>
  <td  width="5%" ><font color="#0000FF">�ͻ����н���</font></td>

  <td  width="4%" >����ƽ��</td>
  <td  width="4%" >ƽ�׾���</td>
  
  <td  width="5%" >��ǰ�����̷�</td>
  <td  width="5%" >�ۺ󣭹��̷�</td>

  <td  width="4%" >��ǰ��˰��</td>
  <td  width="4%" >�ۺ�˰��</td>

  <td  width="4%" >��ǰ�������</td>
  <td  width="4%" >�ۺ󣭹����</td>

  <td  width="4%" >��ǰ������ҵ��������</td>
  <td  width="4%" >�ۺ󣭼���ҵ��������</td>

  <td  width="4%" >��ǰ������ҵ��������</td>
  <td  width="4%" >�ۺ󣭲���ҵ��������</td>

  <td  width="4%" >��ǰ����Ʒ�</td>
  <td  width="4%" >�ۺ���Ʒ�</td>
  </tr>
<%
	//��ȡ�����

		ls_sql="SELECT count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)+NVL(sjhtsjf,0)) zqsjf,sum(NVL(sjf,0)+NVL(sjhtsjf,0)) sjf    ,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx";
		ls_sql+=" where crm_khxx.zt in('2','5') ";//N����Y����
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
	//	out.println(ls_sql);
		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery();
		if (rs.next())
		{
			ALLqys=rs.getInt("qys");
			ALLwdzgce=rs.getDouble("wdzgce");
			ALLqye=rs.getDouble("qye");

			ALLzqgczjf=rs.getDouble("zqgczjf");
			ALLzhgczjf=rs.getDouble("zhgczjf");

			ALLzqsuijin=rs.getDouble("zqsuijin");
			ALLsuijin=rs.getDouble("suijin");

			ALLzqguanlif=rs.getDouble("zqguanlif");
			ALLguanlif=rs.getDouble("guanlif");

			ALLzqqtsf=rs.getDouble("zqqtsf");
			ALLzhqtsf=rs.getDouble("zhqtsf");

			ALLzqwjrqyexm=rs.getDouble("zqwjrqyexm");
			ALLzhwjrqyexm=rs.getDouble("zhwjrqyexm");

			ALLzqsjf=rs.getDouble("zqsjf");
			ALLsjf=rs.getDouble("sjf");

			ALLfwmj=rs.getLong("fwmj");
		}
		rs.close();
		ps.close();

		ls_sql=" SELECT sjs,dwmc,dwbh,sum(qys) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)) zqsjf,sum(NVL(sjf,0)) sjf    ,sum(fwmj) fwmj";
		ls_sql+=" from ";
		ls_sql+=" ( ";
		ls_sql+=" SELECT sjs,dwmc,crm_khxx.dwbh,count(*) qys,sum(wdzgce) wdzgce,sum(qye) qye,sum(zqgczjf) zqgczjf,sum(zhgczjf) zhgczjf,sum(NVL(zqsuijin,0)) zqsuijin,sum(NVL(suijin,0)) suijin,sum(NVL(zqguanlif,0)) zqguanlif,sum(NVL(guanlif,0)) guanlif  ,sum(NVL(zqqtsf,0)) zqqtsf,sum(NVL(zhqtsf,0)) zhqtsf ,sum(NVL(zqwjrqyexm,0)) zqwjrqyexm,sum(NVL(zhwjrqyexm,0)) zhwjrqyexm ,sum(NVL(zqsjf,0)+NVL(sjhtsjf,0)) zqsjf,sum(NVL(sjf,0)+NVL(sjhtsjf,0)) sjf    ,sum(fwmj) fwmj";
		ls_sql+=" FROM crm_khxx,sq_dwxx";
		ls_sql+=" where crm_khxx.dwbh=sq_dwxx.dwbh ";
		ls_sql+=" and crm_khxx.zt in('2','5')";
		ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
		ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
		ls_sql+=wheresql;
		ls_sql+=" group by sjs,dwmc,crm_khxx.dwbh";

		if (sjs.equals(""))
		{
			ls_sql+=" UNION ALL";

			ls_sql+=" SELECT yhmc sjs,dwmc,sq_yhxx.dwbh,0 qys,0 wdzgce,0 qye,0 zqgczjf,0 zhgczjf,0 zqsuijin,0 suijin,0 zqguanlif,0 guanlif  ,0 zqqtsf,0 zhqtsf ,0 zqwjrqyexm,0 zhwjrqyexm ,0 zqsjf,0 sjf    ,0 fwmj";
			ls_sql+=" FROM sq_yhxx,sq_dwxx";
			ls_sql+=" where sq_yhxx.dwbh=sq_dwxx.dwbh and zwbm in('04','23') and sfzszg in('Y','N')";
			ls_sql+=wheresql1;
		}

		ls_sql+=" ) ";

		ls_sql+=" group by sjs,dwmc,dwbh";
		ls_sql+=" order by qye desc";

		ps= conn.prepareStatement(ls_sql);
		rs =ps.executeQuery(ls_sql);
		while (rs.next())
		{
			getsjs=rs.getString("sjs");
			dwmc=rs.getString("dwmc");
			getdwbh=rs.getString("dwbh");

			qys=rs.getInt("qys");
			wdzgce=rs.getDouble("wdzgce");
			qye=rs.getDouble("qye");

			zqgczjf=rs.getDouble("zqgczjf");
			zhgczjf=rs.getDouble("zhgczjf");

			zqsuijin=rs.getDouble("zqsuijin");
			suijin=rs.getDouble("suijin");

			zqguanlif=rs.getDouble("zqguanlif");
			guanlif=rs.getDouble("guanlif");

			zqqtsf=rs.getDouble("zqqtsf");
			zhqtsf=rs.getDouble("zhqtsf");

			zqwjrqyexm=rs.getDouble("zqwjrqyexm");
			zhwjrqyexm=rs.getDouble("zhwjrqyexm");

			zqsjf=rs.getDouble("zqsjf");
			sjf=rs.getDouble("sjf");

			fwmj=rs.getLong("fwmj");


			ls_sql=" SELECT count(*) qys";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and crm_khxx.sjs='"+getsjs+"' and jzkscsj is not null";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				gsskqys=rs1.getInt("qys");
			}
			rs1.close();
			ps1.close();

			ALLgsskqys+=gsskqys;
		
			ls_sql=" SELECT count(*) qys";
			ls_sql+=" FROM crm_khxx";
			ls_sql+=" where crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and crm_khxx.sjs='"+getsjs+"' and cwjzkscsj is not null";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				cwskqys=rs1.getInt("qys");
			}
			rs1.close();
			ps1.close();
			
			ALLcwskqys+=cwskqys;
			
			
			ls_sql=" SELECT sum(fkje) ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh(+) and crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and crm_khxx.sjs='"+getsjs+"' and cw_khfkjl.scbz='N' ";
			ls_sql+=" and cw_khfkjl.fklxbm='11' ";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				jzssk=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			ALLjzssk+=jzssk;
		
			//96�������;54��˰��;11����װ��
			ls_sql=" SELECT sum(fkje) ";
			ls_sql+=" FROM crm_khxx,cw_khfkjl";
			ls_sql+=" where crm_khxx.khbh=cw_khfkjl.khbh(+) and crm_khxx.zt in('2','5')";
			ls_sql+=" and crm_khxx.dwbh='"+getdwbh+"' and crm_khxx.sjs='"+getsjs+"' and cw_khfkjl.scbz='N' ";
			ls_sql+=" and crm_khxx.qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
			ls_sql+=" and crm_khxx.qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
			ps1= conn.prepareStatement(ls_sql);
			rs1 =ps1.executeQuery();
			if (rs1.next())
			{
				khssk=rs1.getDouble(1);
			}
			rs1.close();
			ps1.close();

			ALLkhssk+=khssk;
			
			if (qys==0)
			{
				pjde=0;
			}
			else{
				pjde=(int)(qye/qys);
			}
			if (fwmj==0)
			{
				pmjj=0;
			}
			else{
				pmjj=(int)(qye/fwmj);
			}
			if (wdzgce==0)
			{
				zkl=0;
			}
			else{
				zkl=qye*10/wdzgce;
			}


			if (dwmc.equals(olddm))
			{
			}
			else{
				olddm=dwmc;
				if (bgcolor.equals("#FFFFFF"))
				{
					bgcolor="#E8E8FF";
				}
				else{
					bgcolor="#FFFFFF";
				}
			}

			row++;

			%>
			<tr align="center"  bgcolor="<%=bgcolor%>" onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
				<td ><%=row%>
				</td>
				<td >
					<input name="sjs" type="hidden" value='<%=getsjs+"+"+getdwbh%>'>
					<A HREF="ViewSjsQdMx.jsp?sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>&sjs=<%=getsjs%>&dwbh=<%=getdwbh%>" target="_blank">
					<%=getsjs%>
					</A>
				</td>
				<td ><%=dwmc%></td>
				<td><%=qys%></td>
				<td><%=cf.formatDouble((long)wdzgce)%></td>
				<td><%=cf.round(zkl,1)%></td>
				<td><%=cf.formatDouble((long)qye)%></td>

				
				<td><%=gsskqys%></td>
				<td><%=cwskqys%></td>
				<td><%=cf.formatDouble((long)jzssk)%></td>
				<td><%=cf.formatDouble((long)khssk)%></td>

				<td><%=cf.formatDouble(pjde)%></td>
				<td><%=cf.formatDouble(pmjj)%></td>


				<td><%=cf.formatDouble((long)zqgczjf)%></td>
				<td><%=cf.formatDouble((long)zhgczjf)%></td>
				
				<td><%=cf.formatDouble(zqsuijin)%></td>
				<td><%=cf.formatDouble(suijin)%></td>
				
				<td><%=cf.formatDouble(zqguanlif)%></td>
				<td><%=cf.formatDouble(guanlif)%></td>

				<td><%=cf.formatDouble(zqqtsf)%></td>
				<td><%=cf.formatDouble(zhqtsf)%></td>

				<td><%=cf.formatDouble(zqwjrqyexm)%></td>
				<td><%=cf.formatDouble(zhwjrqyexm)%></td>

				<td><%=cf.formatDouble(zqsjf)%></td>
				<td><%=cf.formatDouble(sjf)%></td>
			</tr>
			<%	
		}
		rs.close();
		ps.close();




	if (ALLqys==0)
	{
		pjde=0;
	}
	else{
		pjde=(int)(ALLqye/ALLqys);
	}
	if (ALLfwmj==0)
	{
		pmjj=0;
	}
	else{
		pmjj=(int)(ALLqye/ALLfwmj);
	}

	if (ALLwdzgce==0)
	{
		zkl=0;
	}
	else{
		zkl=ALLqye*10/ALLwdzgce;
	}


%>
<tr align="center"  bgcolor="#E8E8FF"  onMouseOver="inTr(this)" onMouseOut="outTr(this)"  onclick="onclickTr(this)">
	<td colspan="3" >
	<input type=button value='�鿴ǩ����ϸ' onclick="f_dqmx(listform)">
	<input type=button value='����EXCEL' onclick="f_exp(listform)">
	</td>
	<td><%=ALLqys%></td>
	<td><%=cf.formatDouble((long)ALLwdzgce)%></td>
	<td><%=cf.round(zkl,1)%></td>
	<td><%=cf.formatDouble((long)ALLqye)%></td>

	
	<td><%=ALLgsskqys%></td>
	<td><%=ALLcwskqys%></td>
	<td><%=cf.formatDouble((long)ALLjzssk)%></td>
	<td><%=cf.formatDouble((long)ALLkhssk)%></td>

	<td><%=cf.formatDouble(pjde)%></td>
	<td><%=cf.formatDouble(pmjj)%></td>


	<td><%=cf.formatDouble((long)ALLzqgczjf)%></td>
	<td><%=cf.formatDouble((long)ALLzhgczjf)%></td>
	
	<td><%=cf.formatDouble(ALLzqsuijin)%></td>
	<td><%=cf.formatDouble(ALLsuijin)%></td>
	
	<td><%=cf.formatDouble(ALLzqguanlif)%></td>
	<td><%=cf.formatDouble(ALLguanlif)%></td>

	<td><%=cf.formatDouble(ALLzqqtsf)%></td>
	<td><%=cf.formatDouble(ALLzhqtsf)%></td>

	<td><%=cf.formatDouble(ALLzqwjrqyexm)%></td>
	<td><%=cf.formatDouble(ALLzhwjrqyexm)%></td>

	<td><%=cf.formatDouble(ALLzqsjf)%></td>
	<td><%=cf.formatDouble(ALLsjf)%></td>
</tr>
</table>


</form> 
</body>
</html>

<%
}
catch (Exception e) {
	out.print("Exception: " + e);
	out.print("<BR>SQL: " + ls_sql);
	return;
}
finally 
{
	try{
		if (rs!= null) rs.close(); 
		if (ps!= null) ps.close(); 
		if (rs1!= null) rs1.close(); 
		if (ps1!= null) ps1.close(); 
		if (conn != null) cf.close(conn); 
	}
	catch (Exception e){
		if (conn != null) cf.close(conn); 
	}
}
%>

<script>

function onclickTr(obj)
{
	if (obj.style.background=='#ff33ff')
	{
		obj.style.background='#FFFFFF';
	}
	else
	{
		obj.style.background='#FF33FF';
	}
}
function inTr(obj)
{
	if (obj.style.background!='#ff33ff')
	{
		obj.style.background='#FFFF33';
	}
}
function outTr(obj)
{
	if (obj.style.background=='#ffff33')
	{
		obj.style.background='#FFFFFF';
	}
}

</script> 

<script  LANGUAGE="javascript">
<!--

function f_dqmx(formName)
{
	formName.action="ViewAllSjsQdMx.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
	formName.submit();
	return true;
} 

function f_exp(formName)
{
	formName.action="ViewAllSjsQdMxExec.jsp?fgs=<%=fgs%>&dwbh=<%=dwbh%>&sjfw=<%=sjfw%>&sjfw2=<%=sjfw2%>";
	formName.submit();
	return true;
} 
//-->
</script>

