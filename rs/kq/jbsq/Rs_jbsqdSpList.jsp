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

int curPage=0;//��ǰ��Ҫ��ʾ��ҳ���
String pageStr=request.getParameter("curPage");//��ȡ��ǰҳ��
if (pageObj.needInit(pageStr))//�ж��Ƿ���Ҫ��ʼ��������һ�ν����ҳ������Ҫ��ʼ��
{
	curPage=1;
	String ls_sql=null;
	String wheresql="";
	String ztbm=request.getParameter("ztbm");
	if (ztbm!=null)
	{
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_jbsqd.ztbm='"+ztbm+"')";
	}

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		wheresql+=" and  (rs_jbsqd.fgsbh='"+ssfgs+"')";
	}

	ls_sql="SELECT rs_jbsqd.sqxh,rs_jbsqd.ztbm,DECODE(rs_jbsqd.clzt,'01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��') clzt,ztmc,a.dwmc fgsbh,rs_jbsqd.ygbh,rs_jbsqd.yhmc, DECODE(rs_jbsqd.xb,'M','��','W','Ů') xb,b.dwmc dwbh,rs_jbsqd.xzzwbm,rs_jbsqd.kssj,rs_jbsqd.jzsj,rs_jbsqd.ljts,rs_jbsqd.yysm,rs_jbsqd.sqrq,rs_jbsqd.lrr,rs_jbsqd.lrsj,c.dwmc lrbm,rs_jbsqd.bz,rs_jbsqd.spxh,rs_jbsqd.shr,rs_jbsqd.shsj,shjlmc";
	ls_sql+=" FROM rs_jbsqd,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,rs_shjlbm ";
    ls_sql+=" where rs_jbsqd.fgsbh=a.dwbh(+) and rs_jbsqd.dwbh=b.dwbh(+) and rs_jbsqd.lrbm=c.dwbh(+)";
    ls_sql+=" and rs_jbsqd.shjl=rs_shjlbm.shjl(+) and rs_jbsqd.ztbm=rs_ztbm.ztbm";
    ls_sql+=wheresql;

    ls_sql+=" and rs_jbsqd.ztbm in( ";
	ls_sql+=" select rs_shsq.ztbm ";
	ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
	ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
	ls_sql+=" and rs_ztbm.ztlx='08' and rs_ztbm.ztbm=rs_shsq.ztbm";
    ls_sql+=" ) ";

	ls_sql+=" order by rs_jbsqd.lrsj desc";
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_jbsqdSpList.jsp","","","SpRs_jbsqd.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
//������ʾ��
	
	String[] disColName={"sqxh","clzt","ztmc","fgsbh","ygbh","yhmc","xb","dwbh","xzzwbm","kssj","jzsj","ljts","yysm","sqrq","lrr","lrsj","lrbm","bz","spxh","shr","shsj","shjlmc"};
	pageObj.setDisColName(disColName);


//��������
	String[] keyName={"sqxh","ztbm"};
	pageObj.setKey(keyName);
//���ð�ť����
	String[] buttonName={"����ͬ��"};//��ť����ʾ����
	String[] buttonLink={"PlSpRs_jbsqd.jsp?"};//��ť�������õ���ҳ���������Ӳ���
	int[] buttonNew={1};//���ð�ť�����Ƿ���µĴ��ڣ�0�����򿪣�1����
	pageObj.setButton(buttonName,buttonLink,buttonNew);
//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"sqxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="ViewRs_jbsqd.jsp";//Ϊ�в�����coluParm.link���ó�������
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
  <B><font size="3">����</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(270);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="3%">&nbsp;</td>
	<td  width="3%">�������</td>
	<td  width="3%">����״̬</td>
	<td  width="6%">����״̬</td>
	<td  width="5%">�����ֹ�˾</td>
	<td  width="3%">Ա�����</td>
	<td  width="3%">Ա������</td>
	<td  width="2%">�Ա�</td>
	<td  width="5%">��������</td>
	<td  width="4%">ְ��</td>

	<td  width="4%">��ʼʱ��</td>
	<td  width="4%">����ʱ��</td>
	<td  width="3%">�ۼ�Сʱ</td>
	<td  width="14%">ԭ��˵��</td>
	<td  width="4%">��������</td>
	<td  width="3%">¼����</td>
	<td  width="4%">¼��ʱ��</td>
	<td  width="5%">¼�벿��</td>
	<td  width="9%">��ע</td>
	<td  width="3%">�������</td>
	<td  width="3%">�����</td>
	<td  width="4%">���ʱ��</td>
	<td  width="4%">��˽���</td>
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