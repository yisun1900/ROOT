<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<%@ include file="/getlogin.jsp" %>

<%
	ybl.common.PageObject pageObj=new ybl.common.PageObject();
	
	String ls_sql=null;

	String ddlx=request.getParameter("ddlx");
	String fgsbh=request.getParameter("fgsbh");
	String sjfw=request.getParameter("sjfw");
	String sjfw2=request.getParameter("sjfw2");
	String gys=cf.GB2Uni(cf.getParameter(request,"gys"));
	String zcdlbm=cf.GB2Uni(cf.getParameter(request,"zcdlbm"));
	String ppbm=cf.GB2Uni(cf.getParameter(request,"ppbm"));

%>
<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">��Ӧ�̽����Ѹ�����ϸ��<%=gys%>��
  <BR>(����ʱ�䣺<%=sjfw%>--<%=sjfw2%>)</font></b>
</CENTER>
<table border="1" width="470%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">&nbsp;</td>
   	<td  width="1%">�������</td>
	<td  width="2%">����״̬</td>
	<td  width="2%">��������</td>
	<td  width="2%">��Ʒ��</td>
	<td  width="2%">����״̬</td>
	<td  width="2%" bgcolor="#99FFFF"><strong>������</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>��ͬ��-��ǰ</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ��-�ۺ�</font></strong></td>
	<td  width="2%">ǩ��ͬʱ��</td>
	<td  width="2%">���ʱ��</td>
	<td  width="2%">����ʱ��</td>
	<td  width="1%">�ͻ�����</td>
	<td  width="4%">���ݵ�ַ</td>
	<td  width="1%">פ��Ҿӹ���</td>
	<td  width="2%">���Ĵ���</td>
	<td  width="4%">��Ӧ��</td>
	<td  width="1%">�Ƿ�����װ��ͬ</td>
	<td  width="2%">���̽���</td>
	<td  width="4%">�μӴ����</td>
	<td  width="1%">��װ���ʦ</td>
	<td  width="3%">ǩԼ����</td>
	<td  width="1%">չ���Ҿӹ���</td>
	<td  width="1%">��ĿרԱ</td>
	<td  width="1%">�ۿ���</td>
	<td  width="2%"><strong>��ͬ���Ͷ�</strong></td>
	<td  width="2%"><strong>���������Ͷ�</strong></td>

	<td  width="2%" bgcolor="#99FFFF"><strong>��ͬ���Ϸ�-��ǰ</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong><font color="#0000CC">��ͬ���Ϸ�-�ۺ�</font></strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>��ͬԶ�̷�</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>�ײͶ���Զ�̷�</strong></td>
	<td  width="2%" bgcolor="#99FFFF"><strong>��ͬ������</strong></td>


	<td  width="2%" bgcolor="#99FFFF"><strong>��ͬ�������</strong></td>
	<td  width="2%"><strong>������-��ǰ</strong></td>
	<td  width="2%"><strong><font color="#0000CC">������-�ۺ�</font></strong></td>

	<td  width="2%"><strong>��������Ϸ�-��ǰ</strong></td>
	<td  width="2%"><strong><font color="#0000CC">��������Ϸ�-�ۺ�</font></strong></td>
	<td  width="2%"><strong>������Զ�̷�</strong></td>
	<td  width="2%"><strong>������������</strong></td>
	
	<td  width="2%"><strong>������������</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong>ȫ���ܶ�-��ǰ</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong><font color="#0000CC">ȫ���ܶ�-��ǰ</font></strong></td>


	<td  width="2%" bgcolor="#FFFFCC"><strong>���Ϸ��ܼ�-��ǰ</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong><font color="#0000CC">���Ϸ��ܼ�-�ۺ�</font></strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong>Զ�̷��ܼ�</strong></td>
	<td  width="2%" bgcolor="#FFFFCC"><strong>�������ܼ�</strong></td>
	
	<td  width="2%" bgcolor="#FFFFCC"><strong>�����ܶ�</strong></td>
	<td  width="2%">����ȷ��ʱ��</td>
	<td  width="2%">¼��ʱ��</td>
	<td  width="1%">�ͻ����</td>
	<td  width="55%">��ע</td>
</tr>

<%
	ls_sql="SELECT '',jc_zcdd.ddbh,clztmc,DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������'),ppbm,DECODE(jc_zcdd.sfjs,'N','δ����','C','��ѡ�����','Y','�ѽ���','M','���������','F','���㸶��'),jc_zcdd.cbze+round(jc_zcdd.ycf*jc_zcdd.ycfjsbl/100,2)+round(jc_zcdd.qtf*jc_zcdd.azfjsbl/100,2),jc_zcdd.wdzje,jc_zcdd.hkze,jc_zcdd.qhtsj,jc_zcdd.wjsj,jc_zcdd.jssj,crm_khxx.khxm,crm_khxx.fwdz,jc_zcdd.clgw,zcdlbm,gys,DECODE(jc_zcdd.sfjrht,'Y','����','N','������') sfjrht,ysgcjdmc,cxhdbm,crm_khxx.sjs,c.dwmc dm,jc_zcdd.ztjjgw,jc_zcdd.xmzy,TO_CHAR(jc_zcdd.zczkl) zczkl,jc_zcdd.zsje,jc_zcdd.zjxzsje,jc_zcdd.zqclf,jc_zcdd.zhclf,jc_zcdd.ycf,jc_zcdd.qtycf,jc_zcdd.qtf,jc_zcdd.htcxhdje,jc_zcdd.zqzjhze,jc_zcdd.zjhze,jc_zcdd.zqzjxclf,jc_zcdd.zhzjxclf,jc_zcdd.zjxycf,jc_zcdd.zjxqtf,jc_zcdd.zjxcxhdje,jc_zcdd.wdzje+jc_zcdd.zqzjhze,jc_zcdd.hkze+jc_zcdd.zjhze,jc_zcdd.zqclf+jc_zcdd.zqzjxclf,jc_zcdd.zhclf+jc_zcdd.zhzjxclf,jc_zcdd.ycf+jc_zcdd.zjxycf,jc_zcdd.qtf+jc_zcdd.zjxqtf,jc_zcdd.htcxhdje+jc_zcdd.zjxcxhdje,jc_zcdd.ddqrsj,jc_zcdd.lrsj,jc_zcdd.khbh,jc_zcdd.bz";
	ls_sql+=" FROM crm_khxx,jc_zcdd,sq_dwxx c ,jdm_zcddzt,dm_gcjdbm ";
	ls_sql+=" where jc_zcdd.khbh=crm_khxx.khbh(+) and crm_khxx.dwbh=c.dwbh(+)";
	ls_sql+=" and jc_zcdd.clzt=jdm_zcddzt.clzt(+) ";
	ls_sql+=" and crm_khxx.gcjdbm=dm_gcjdbm.gcjdbm(+)";


	ls_sql+=" and jc_zcdd.sfjs in('F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶��
	ls_sql+=" and jc_zcdd.jssj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zcdd.jssj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zcdd.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_zcdd.gys='"+gys+"'";
	ls_sql+=" and jc_zcdd.zcdlbm='"+zcdlbm+"'";
	ls_sql+=" and jc_zcdd.ppbm='"+ppbm+"'";
	ls_sql+=" and jc_zcdd.ddlx='"+ddlx+"'";



	ls_sql+=" order by jssj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%> 
</table>

<BR>

<table border="1" width="270%" cellspacing="0" cellpadding="1"  bgcolor="#000000" style='FONT-SIZE: 12px'>
<tr bgcolor="#CCCCCC"  align="center">
    <td  width="1%">&nbsp;</td>
	<td  width="3%">���������</td>
	<td  width="3%">����״̬</td>
	<td  width="3%">��������</td>
	<td  width="4%">��Ʒ��</td>
	<td  width="3%">����״̬</td>
	<td  width="3%" bgcolor="#CC99FF">������</td>
	<td  width="3%">��ǰ�������ܶ�</td>
	<td  width="3%">�ۺ��������ܶ�</td>
	<td  width="3%">�������ʱ��</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">����ʱ��</td>
	<td  width="3%">�ͻ�����</td>
	<td  width="7%">���ݵ�ַ</td>
	<td  width="2%">פ��Ҿӹ���</td>
	<td  width="3%">���Ĵ���</td>
	<td  width="7%">��Ӧ��</td>
	<td  width="3%">������������</td>
	<td  width="2%">������</td>
	<td  width="2%" bgcolor="#CC99FF">�������ۿ�</td>
	<td  width="5%">����ԭ��</td>
	<td  width="3%">�������</td>
	<td  width="2%">չ���Ҿӹ���</td>
	<td  width="2%">��ĿרԱ</td>
	<td  width="3%">ȷ��ʱ��</td>
	<td  width="4%">������ԭ��</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="3%">��ͬ��</td>
	<td  width="2%">�ͻ����</td>
	<td  width="27%">��ע</td>
</tr>
<%
	ls_sql="SELECT '',jc_zczjx.zjxbh,DECODE(jc_zczjx.clzt,'00','¼��δ���','01','¼�������','02','��ȷ��','04','�����ѽ���','03','���ͻ�','05','�����ͻ�','30','�������','99','�˵�'),DECODE(jc_zcdd.ddlx,'1','����Ʒ','3','��¼��ͬ','4','�п�涩��','5','��׼�ײ�','6','�Ҿ߽����ײ�','7','��ů�����ײ�','8','�����ײ�','9','��������','A','��������','B','��������շ�','C','ѡ������','D','�ײ�������') ddlx,jc_zczjx.ppbm,DECODE(jc_zczjx.sfjs,'N','δ����','C','��ѡ�����','Y','�ѽ���','M','���������','F','���㸶��') sfjs,jc_zczjx.zjxcbze+jc_zczjx.zjxycf+jc_zczjx.zjxqtf,jc_zczjx.zqzjxze,jc_zczjx.zjxze,jc_zczjx.zjxfssj,jc_zczjx.wjsj,jc_zczjx.jissj,crm_khxx.khxm,crm_khxx.fwdz,jc_zczjx.clgw,jc_zczjx.zcdlbm,jc_zczjx.gys,jc_zczjx.zjxcxhdje,jc_zczjx.jisr,TO_CHAR(jc_zczjx.zjxzkl) zjxzkl,jc_zczjx.dzyy,jc_zczjx.ddbh,jc_zczjx.ztjjgw,jc_zczjx.xmzy,jc_zczjx.qrsj,zczjxyymc,jc_zczjx.lrsj,dwmc lrbm,crm_khxx.hth,crm_khxx.khbh,jc_zczjx.bz";
	ls_sql+=" FROM crm_khxx,jc_zczjx,jc_zcdd,sq_dwxx,jdm_zczjxyybm";
    ls_sql+=" where jc_zczjx.khbh=crm_khxx.khbh and jc_zczjx.dwbh=sq_dwxx.dwbh and jc_zczjx.zczjxyybm=jdm_zczjxyybm.zczjxyybm(+)";
	ls_sql+=" and jc_zczjx.ddbh=jc_zcdd.ddbh";

	ls_sql+=" and jc_zczjx.sfjs in('F')";//N��δ���㣻C����ѡ����㣻Y���ѽ��㣻M����������ˣ�F�����㸶��
	ls_sql+=" and jc_zczjx.jissj>=TO_DATE('"+sjfw+"','YYYY-MM-DD')";
	ls_sql+=" and jc_zczjx.jissj<=TO_DATE('"+sjfw2+" 23:59:59','YYYY-MM-DD HH24:MI:SS')";
	ls_sql+=" and jc_zczjx.fgsbh='"+fgsbh+"'";
	ls_sql+=" and jc_zczjx.gys='"+gys+"'";
	ls_sql+=" and jc_zczjx.zcdlbm='"+zcdlbm+"'";
	ls_sql+=" and jc_zczjx.ppbm='"+ppbm+"'";
	ls_sql+=" and jc_zcdd.ddlx='"+ddlx+"'";

    ls_sql+=" order by jc_zczjx.jissj";

//	out.println(ls_sql);

    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("","","","");
	pageObj.setPageRow(50000);//����ÿҳ��ʾ��¼��

//�����г�������
	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey2={"khbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey2;//�����в�����coluParm.key������
	coluParm.link="/khxx/ViewCrm_khxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("khxm",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey3={"ddbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey3;//�����в�����coluParm.key������
	coluParm.link="/jcjj/zcdd/ViewJeJc_zcdd.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ddbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	pageObj.out=out;
	pageObj.getDate(1);
	pageObj.printDateSum(true);
%>
</body>
</html>