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
		if (!(ztbm.equals("")))	wheresql+=" and  (rs_ygbdsqb.ztbm='"+ztbm+"')";
	}

	if ( !yhjs.equals("A0") && !yhjs.equals("A1") )
	{
		wheresql+=" and  (rs_ygbdsqb.fgsbh='"+ssfgs+"')";
	}

	ls_sql="SELECT rs_ygbdsqb.bdxh,rs_ygbdsqb.ztbm,DECODE(rs_ygbdsqb.clzt,'00','��������','01','�ȴ�����','02','��������','03','����ͨ��','04','����ȡ��') clzt,rs_ztbm.ztmc,rs_ygbdsqb.ygbh,sq_yhxx.yhmc,sq_yhxx.bianhao,bdsxrq,DECODE(bdxz,'01','ת��','02','��н','03','��ְ','04','��ְ','05','��ְ','06','����','07','����','08','����','99','����') bdxz,a.dwmc fgsbh,tcf,bdyy,b.dwmc dwbh,c.dwmc dwbh2,rs_ygbdsqb.zwbm,zwbm2,rs_ygbdsqb.lrsj,rs_ygbdsqb.lrr,rs_ygbdsqb.bz,rs_ygbdsqb.spxh,rs_ygbdsqb.shr,rs_ygbdsqb.shsj,shjlmc,rs_ygbdsqb.shyj";
	ls_sql+=" FROM rs_ygbdsqb,sq_dwxx a,sq_dwxx b,sq_dwxx c,rs_ztbm,sq_yhxx,rs_shjlbm  ";
    ls_sql+=" where  rs_ygbdsqb.fgsbh=a.dwbh and rs_ygbdsqb.dwbh=b.dwbh and rs_ygbdsqb.dwbh2=c.dwbh";
    ls_sql+=" and rs_ygbdsqb.ztbm=rs_ztbm.ztbm(+) and rs_ygbdsqb.shjl=rs_shjlbm.shjl(+)";
    ls_sql+=" and rs_ygbdsqb.ygbh=sq_yhxx.ygbh(+)";
    ls_sql+=wheresql;

    ls_sql+=" and rs_ygbdsqb.ztbm in( ";
	ls_sql+=" select rs_shsq.ztbm ";
	ls_sql+=" from rs_shsq,sq_yhssz,rs_ztbm ";
	ls_sql+=" where rs_shsq.yhzbh=sq_yhssz.yhzbh and sq_yhssz.yhdlm='"+yhdlm+"'";
	ls_sql+=" and rs_ztbm.ztlx='03' and rs_ztbm.ztbm=rs_shsq.ztbm";
    ls_sql+=" ) ";

	ls_sql+=" order by rs_ygbdsqb.lrsj desc";

//	out.println(ls_sql);
    pageObj.sql=ls_sql;
//���ж����ʼ��
	pageObj.initPage("Rs_ygbdsqbSpList.jsp","","","SpRs_ygbdsqb.jsp");
//	pageObj.setPageRow(10);//����ÿҳ��ʾ��¼��
	pageObj.setEditStr("����");
//������ʾ��


	String[] disColName={"bdxh","clzt","ztmc","ygbh","yhmc","bianhao","bdsxrq","bdxz","fgsbh","tcf","bdyy","dwbh","dwbh2","zwbm","zwbm2" ,"lrsj","lrr","bz","spxh","shr","shsj","shjlmc","shyj"};
	pageObj.setDisColName(disColName);
//	String[] disColName={"bdxh","clzt","ztmc","ygbh","yhmc","bianhao","bdsxrq","bdxz","fgsbh","tcf","bdyy","dwbh","dwbh2","zwbm","zwbm2" ,"lrsj","lrbm","bz","spxh","shr","shsj","shjlmc","shyj"};

//��������
	String[] keyName={"bdxh","ztbm"};
	pageObj.setKey(keyName);

//�����г�������
	Hashtable coluParmHash=new Hashtable();
	ColuParm coluParm=null;

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey={"ygbh"};//�����в�����coluParm.key������
	coluParm.key=coluKey;//�����в�����coluParm.key������
	coluParm.link="/rs/yghmcgl/ViewSq_yhxx.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("ygbh",coluParm);//�в����������Hash��
	pageObj.setColuLink(coluParmHash);//�в����������Hash��

	coluParm=new ColuParm();//����һ���в�������
	String[] coluKey1={"bdxh"};//�����в�����coluParm.key������
	coluParm.key=coluKey1;//�����в�����coluParm.key������
	coluParm.link="/rs/ygydsp/ViewRs_ygbdsqb.jsp";//Ϊ�в�����coluParm.link���ó�������
	coluParm.bolt="target='_blank'";//Ϊ�в�����coluParm.link���ó�������
	coluParmHash.put("bdxh",coluParm);//�в����������Hash��
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
  <B><font size="3">���±䶯������</font></B>
</CENTER>
<%
	pageObj.out=out;
	pageObj.getDate(curPage);
	pageObj.printPageLink(330);
%>
<tr bgcolor="#CCCCCC"  align="center">
	<td  width="2%">&nbsp;</td>
	<td  width="3%">�䶯���</td>
	<td  width="3%">����״̬</td>
	<td  width="4%">����״̬</td>
	<td  width="2%">Ա�����</td>
	<td  width="3%">����</td>
	<td  width="2%">����</td>
	<td  width="3%">�䶯��Чʱ��</td>
	<td  width="3%">�䶯����</td>
	<td  width="4%">�걨��˾</td>
	<td  width="5%">�����</td>
	<td  width="12%">�䶯ԭ��</td>
	<td  width="5%">�䶯ǰ����</td>
	<td  width="5%">�䶯����</td>
	<td  width="4%">�䶯ǰ��λ</td>
	<td  width="4%">�䶯���λ</td>
	<td  width="3%">¼��ʱ��</td>
	<td  width="2%">¼����</td>
	<td  width="10%">��ע</td>
	<td  width="2%">�������</td>
	<td  width="2%">�����</td>
	<td  width="3%">���ʱ��</td>
	<td  width="3%">��˽���</td>
	<td  width="10%">������</td>
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