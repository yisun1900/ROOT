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

	ls_sql="SELECT rs_czsq.sqxh,DECODE(rs_czsq.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��','05','����ְ') clzt,ztmc,a.dwmc fgsbh,rs_czsq.ygbh,rs_czsq.yhmc,rs_czsq.bianhao,rs_czsq.sfzh,rs_czsq.xzzwbm,rs_czsq.rzsj,b.dwmc dwbh,lzyyflmc,rs_czsq.yysm,rs_czsq.sqrq,rs_czsq.lrr,rs_czsq.lrsj,c.dwmc lrbm,rs_czsq.bz,rs_czsq.spxh,rs_czsq.shr,rs_czsq.shsj,shjlmc,rs_czsq.shyj";
	ls_sql+=" FROM rs_czsq,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm,dm_lzyyflbm,rs_czsqspb ";
    ls_sql+=" where rs_czsq.fgsbh=a.dwbh(+) and rs_czsq.dwbh=b.dwbh(+) and rs_czsq.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_czsq.shjl=rs_shjlbm.shjl(+) and rs_czsq.ztbm=rs_ztbm.ztbm and rs_czsq.lzyyflbm=dm_lzyyflbm.lzyyflbm(+)";
    ls_sql+=" and rs_czsq.spxh=rs_czsqspb.spxh";

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		ls_sql+=" and  (rs_czsq.fgsbh='"+ssfgs+"')";
	}
	
	ls_sql+=" and rs_czsq.shr='"+yhmc+"'";
	ls_sql+=" and rs_czsqspb.yztbm='"+ztbm+"'";

	ls_sql+=" order by rs_czsq.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_czsqXgSpList.jsp","","","XgSpRs_czsq.jsp?ztbm="+ztbm);
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
/*
//������ʾ��
	String[] disColName={"sqxh","sq_dwxx_dwmc","rs_czsq_ygbh","rs_czsq_yhmc","rs_czsq_xb","rs_czsq_yfgsbh","rs_czsq_dwbh","rs_czsq_xzzwbm","rs_czsq_yrzsj","rs_czsq_ylzrq","rs_czsq_ylzyy","rs_czsq_xdwbh","rs_czsq_xxzzwbm","rs_czsq_xrzyy","rs_czsq_lrr","rs_czsq_lrsj","rs_czsq_lrbm","rs_czsq_bz","rs_czsq_clzt","rs_czsq_ztbm","rs_czsq_spxh","rs_czsq_shr","rs_czsq_shsj","rs_czsq_shjl","rs_czsq_shyj"};
	pageObj.setDisColName(disColName);
*/


//��������
	String[] keyName={"sqxh"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"ɾ��������Ϣ"};//��ť����ʾ����
	String[] buttonLink={"DeleteSpRs_czsq.jsp?ztbm="+ztbm};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_czsq.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">��ְ���룭�޸�����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(310);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">��ְ�������</td>
	<td  width="3%">����״̬</td>
	<td  width="5%">����״̬</td>
	<td  width="4%">�����ֹ�˾</td>
	<td  width="2%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="3%">����</td>
	<td  width="5%">���֤��</td>
	<td  width="3%">����ְ��</td>
	<td  width="3%">��ְ����</td>
	<td  width="5%">��������</td>

	<td  width="4%">��ְԭ�����</td>
	<td  width="13%">��ְԭ��</td>
	<td  width="3%">��������</td>
	<td  width="3%">¼����</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="8%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="3%">�����</td>
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