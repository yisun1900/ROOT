<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;
	String dwbh=cf.GB2Uni(request.getParameter("dwbh"));
	String sjs=cf.GB2Uni(cf.getParameter(request,"sjs"));
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String jzbz=request.getParameter("jzbz");

	String wheresql="";

	wheresql+=" and qyrq>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	wheresql+=" and qyrq<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	if (!jzbz.equals("0"))
	{
		wheresql+=" and  crm_khxx.jzbz='"+jzbz+"'";
	}

	ls_sql="SELECT '',sjs,hth,khxm,fwdz,DECODE(crm_khxx.jzbz,'1','��װ','2','��װ'),cxhdbm,wdzgce,TO_CHAR(zkl),qye,suijinbfb||'%',suijin,guanlif,qye+NVL(suijin,0)+NVL(guanlif,0),TO_CHAR(jzkscsj,'YYYY-MM-DD'),TO_CHAR(cwjzkscsj,'YYYY-MM-DD'),sjf,glf,zjxje,zhzjxje,zjxsuijin,zjxguanlif,zhzjxje+NVL(zjxsuijin,0)+NVL(zjxguanlif,0),qye+NVL(suijin,0)+NVL(guanlif,0)+zhzjxje+NVL(zjxsuijin,0)+NVL(zjxguanlif,0),NVL(suijin,0)+NVL(zjxsuijin,0),DECODE(crm_khxx.sffj,'Y','����','N','��'),crm_khxx.fjje,crm_khxx.gsfje,DECODE(crm_khxx.sfyrz,'Y','��֤','N','��'),b.dwmc rzsc,a.dwmc qydm,TO_CHAR(lrsj,'YYYY-MM-DD HH24:MI'),TO_CHAR(qyrq,'YYYY-MM-DD'),DECODE(TO_CHAR(lrsj,'MM')-TO_CHAR(qyrq,'MM'),0,'��','<font color=\"#FF0000\">����</font>'),sgdmc sgd,zjxm";
	ls_sql+=" FROM crm_khxx,sq_dwxx a,sq_dwxx b,sq_sgd";
    ls_sql+=" where crm_khxx.dwbh=a.dwbh(+) and crm_khxx.rzsc=b.dwbh(+) and crm_khxx.sgd=sq_sgd.sgd(+)";
    ls_sql+=" and crm_khxx.sjs='"+sjs+"' and crm_khxx.dwbh='"+dwbh+"'";
	ls_sql+=" and crm_khxx.zt in('2','5')";
	ls_sql+=wheresql;
	ls_sql+=" order by lrsj";

 //	out.println(ls_sql);

   pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��
	pageObj.setDateType("long");//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"hth"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewHthCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("fwdz",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">���ʦǩ����ϸ��<%=sjs%>��
  <BR>(ͳ��ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="350%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="1%">&nbsp;</td>
	<td  width="2%">���ʦ</td>
	<td  width="2%">��ͬ��</td>
	<td  width="2%">����</td>
	<td  width="5%">���ݵ�ַ</td>
	<td  width="2%">��װ��־</td>
	<td  width="7%">�����</td>
	<td  width="3%">δ���۹��̶�(����˰������)</td>
	<td  width="1%">�ۿ���</td>
	<td  width="3%">����ǩԼ��(����˰������)</td>
	<td  width="2%">˰��</td>
	<td  width="3%">˰��</td>
	<td  width="3%">�����</td>
	<td  width="3%">��װҵ��(����+˰��+�����)</td>

	<td  width="3%">�״θ���װ��ʱ��</td>
	<td  width="3%">�����״��ռ�װ��ʱ��</td>
	<td  width="3%">��Ʒ�</td>
	<td  width="3%">�����</td>
	<td  width="3%">��ǰ������(����˰������)</td>
	<td  width="3%">�ۺ󹤳�������(����˰������)</td>
	<td  width="3%">������˰��(�ۺ�)</td>
	<td  width="3%">����������(�ۺ�)</td>
	<td  width="3%">������С��(����+˰��+�����)</td>
	<td  width="3%">�������ܶ�(����+˰��+�����) </td>
	<td  width="3%">������˰���ܶ�</td>
	<td  width="2%">�Ƿ񷵾�</td>
	<td  width="3%">�����ܽ��</td>
	<td  width="3%">��˾�е������</td>
	<td  width="2%">�Ƿ���֤</td>
	<td  width="3%">��֤�г�</td>
	<td  width="4%">ǩԼ����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="2%">ǩԼ����</td>
	<td  width="1%">����¼��</td>
	<td  width="2%">ʩ����</td>
	<td  width="2%">�ʼ�Ա</td>
</tr>
<%
	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>
</body>
</html>