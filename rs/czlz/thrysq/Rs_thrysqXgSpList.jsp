<%@ page contentType="text/html;charset=GBK" %>
<%@ page import='ybl.common.*,java.sql.*,java.util.*' %>
<jsp:useBean id="cf" scope="page" class="ybl.common.CommonFunction"/>
<jsp:useBean id="pageObj" scope="session" class="ybl.common.PageObject"/>
<%@ include file="/getlogin.jsp" %>

<%
	String yhjs=(String)session.getAttribute("yhjs");
	String ssfgs=(String)session.getAttribute("ssfgs");
%>
<%
String yhdlm=(String)session.getAttribute("yhdlm");
String yhmc=(String)session.getAttribute("yhmc");

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ztbm=request.getParameter("ztbm");

	ls_sql="SELECT rs_thrysq.sqxh,DECODE(rs_thrysq.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��') clzt,ztmc,a.dwmc fgsbh,rs_thrysq.ygbh,rs_thrysq.yhmc,rs_thrysq.bianhao,rs_thrysq.sfzh,rs_thrysq.xzzwbm,rs_thrysq.rzsj,b.dwmc dwbh,rs_thrysq.yysm,rs_thrysq.gzbx,rs_thrysq.wpjjqk,rs_thrysq.sqrq,rs_thrysq.lrr,rs_thrysq.lrsj,c.dwmc lrbm,rs_thrysq.bz,rs_thrysq.spxh,rs_thrysq.shr,rs_thrysq.shsj,shjlmc,rs_thrysq.shyj";
	ls_sql+=" FROM rs_thrysq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_thrysq.fgsbh=a.dwbh(+) and rs_thrysq.dwbh=b.dwbh(+) and rs_thrysq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_thrysq.shjl=rs_shjlbm.shjl(+) and rs_thrysq.ztbm=rs_ztbm.ztbm ";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_thrysq.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_thrysq.shr='"+yhmc+"'";
	ls_sql+=" and rs_thrysq.ztbm in(select xyztbm from rs_shztlc where ztbm='"+ztbm+"')";

	ls_sql+=" order by rs_thrysq.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_thrysqXgSpList.jsp","","","XgSpRs_thrysq.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_thrysq_ygbh","rs_thrysq_yhmc","rs_thrysq_xb","rs_thrysq_yfgsbh","rs_thrysq_dwbh","rs_thrysq_xzzwbm","rs_thrysq_yrzsj","rs_thrysq_ylzrq","rs_thrysq_ylzyy","rs_thrysq_xdwbh","rs_thrysq_xxzzwbm","rs_thrysq_xrzyy","rs_thrysq_lrr","rs_thrysq_lrsj","rs_thrysq_lrbm","rs_thrysq_bz","rs_thrysq_clzt","rs_thrysq_ztbm","rs_thrysq_spxh","rs_thrysq_shr","rs_thrysq_shsj","rs_thrysq_shjl","rs_thrysq_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpRs_thrysq.jsp?ztbm="+ztbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_thrysq.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("sqxh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��
/*
//������������ʾ��ʽ
	pageObj.setKeyMark("SQL");//SQL��������SQL�ķ�ʽ��ʾ��PARAM��������"123*we*4455"�ķ�ʽ��ʾ
*/
}
else//�ǵ�һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=Integer.parseInt(pageStr);
}
%>

<html>
<head>
</head>
<body bgcolor="#ffffff" text="#000000" style='FONT-SIZE: 12px'>
<CENTER >
  <B><font size="3">�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(380);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="2%">�˻���Ա�������</td>
	<td  width="2%">����״̬</td>
	<td  width="4%">����״̬</td>
	<td  width="3%">�����ֹ�˾</td>
	<td  width="2%">Ա�����</td>
	<td  width="2%">Ա������</td>
	<td  width="2%">����</td>
	<td  width="4%">���֤��</td>
	<td  width="3%">����ְ��</td>
	<td  width="3%">��ְ����</td>
	<td  width="4%">��������</td>

	<td  width="10%">�˻�ԭ��</td>
	<td  width="10%">��ְ�ڼ乤������</td>
	<td  width="10%">��Ʒ�������</td>
	<td  width="3%">��������</td>
	<td  width="2%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="4%">¼�벿��</td>
	<td  width="7%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="8%">������</td>
</tr>
<%
	pageObj.displayDate();
	pageObj.displayFoot();
%> 

</body>
<script  LANGUAGE="javascript">
<!--
<%
	pageObj.printScript();
%> 
//-->
</script>
</html>